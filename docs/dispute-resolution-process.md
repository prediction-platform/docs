# Dispute Resolution Process

## Background

When users have objections to event results, a **neutral third party** is required to make the final ruling. The dispute resolution process provides a fair and transparent mechanism for resolving disagreements about event outcomes through a decentralized arbitration system.

## Overview

The dispute resolution process allows event participants to challenge event results through a structured arbitration system. The process involves multiple stakeholders including disputing users, administrators, arbitrators, and the DAO contract, ensuring fair and transparent resolution of disputes.

### Key Participants

- **Disputing Users**: Event participants who object to results
- **DP Management System**: Administrators who manage dispute initiation
- **Arbitrators**: Authorized voters who make final decisions
- **DAO Contract**: Smart contract that manages arbitration process
- **Asset Managers**: Administrators who execute final settlement

## Dispute Resolution Workflow

### Step 1: User Submits Dispute

#### **Prerequisites**

Users can submit disputes through the DApp page, but must meet the following conditions:

1. **Event Participation**
   - User must be a participant in the event
   - Only event participants can dispute results

2. **Vault Balance Requirement**
   - User's vault balance must be **greater than 10 USDT**
   - Ensures users have sufficient funds for arbitration fees

3. **Arbitration Fee Payment**
   - User must transfer **10 USDT** from vault to DAO contract
   - This amount serves as reward for arbitrators
   - Transfer must be completed before dispute submission

4. **Transaction Hash Submission**
   - User submits the transaction hash as a parameter via API to DP service
   - Transaction hash proves the fee payment
   - API validates the transaction and dispute eligibility

#### **Dispute Submission Process**

1. **Access Dispute Page**
   - Navigate to event detail page
   - Click "Dispute Result" button
   - System checks user eligibility

2. **Verify Conditions**
   - System verifies user is event participant
   - Checks vault balance > 10 USDT
   - Validates user hasn't already disputed

3. **Pay Arbitration Fee**
   - Transfer 10 USDT to DAO contract
   - Receive transaction hash
   - Confirm transaction completion

4. **Submit Dispute**
   - Enter transaction hash
   - Submit dispute via API
   - Receive dispute confirmation

### Step 2: DP Management System Processes Dispute

#### **Dispute Activation Conditions**

The DP management system receives the dispute request and checks activation conditions:

- **Minimum Disputing Users**: More than 10 users must have submitted disputes
- **Administrator Approval**: Administrator must manually activate dispute arbitration
- **Event Eligibility**: Event must be eligible for dispute (in whitelist)

#### **Administrator Actions**

Once conditions are met, administrator initiates the dispute arbitration process:

##### **2.1 Activate pool.disputeResult**

- **Action**: Mark condition as "in dispute"
- **Effect**: Prevents result finalization
- **Status**: Condition cannot be settled while in dispute

##### **2.2 Authorize DAO Contract**

- **Action**: Execute `gamemanager.addPoolGameAdmin`
- **Purpose**: Grant DAO contract admin role for the pool
- **Effect**: DAO contract gains authority to finalize results

##### **2.3 Create Arbitration Condition**

- **Action**: Execute DAO contract `createCondition(pool, conditionId, expirationTime)`
- **Parameters**:
  - `pool`: Pool address
  - `conditionId`: Condition identifier
  - `expirationTime`: Arbitration deadline
- **Effect**: Arbitration process officially begins

##### **2.4 Whitelist Requirement**

- **Requirement**: Event creator must be in whitelist
- **Verification**: System checks creator address against whitelist
- **Restriction**: Only whitelisted creators can initiate disputes

### Step 3: Arbitrator Voting

#### **3.1 Arbitration Event Page**

- **Location**: New page in DApp "More" menu
- **Access**: "Arbitration Events" page
- **Visibility**: 
  - **Public View**: All users can see dispute events/conditions list
  - **Voting Access**: Only arbitrators can vote (enforced by DAO contract)

#### **3.2 Arbitrator Access**

- **Login**: Arbitrator logs into DApp system
- **Wallet Connection**: Arbitrator connects wallet
- **Verification**: System verifies arbitrator role via DAO contract

#### **3.3 View Dispute Events**

- **Display**: Arbitrator sees all disputed events and conditions
- **Information Shown**:
  - Event details
  - Condition information
  - Dispute reasons
  - Current voting status
  - Expiration time

#### **3.4 Cast Vote**

- **Vote Options**: 
  - **YES**: Agree with disputed result
  - **NO**: Disagree with disputed result
- **Vote Restrictions**:
  - Cannot vote if already voted
  - Cannot vote if arbitration ended
  - Cannot vote if expiration time passed
- **Action**: Call DAO contract vote function
- **Verification**: DAO contract validates vote eligibility

#### **3.5 Automatic Finalization**

- **Threshold**: DAO contract reaches voting threshold (2-of-3)
- **Action**: DAO contract automatically executes `pool.finalizeResult`
- **Event**: DAO contract emits finalization event
- **Status**: Arbitration process completes

### Step 4: DP Monitoring System

#### **4.1 Event Monitoring**

- **Monitoring**: System monitors DAO contract events
- **Event Type**: Arbitration completion event
- **Action**: Update database status when event detected
- **Status Update**: Mark dispute as resolved in database

#### **4.2 Status Synchronization**

- **Real-time Updates**: Monitor system updates status in real-time
- **Database Sync**: Ensure database reflects on-chain state
- **Notification**: Notify relevant parties of resolution

### Step 5: User View Results

#### **5.1 View Arbitration Process**

- **Access**: Users can view arbitration process through DApp
- **Information Available**:
  - Current voting status
  - Number of votes cast
  - Time remaining
  - Arbitrator participation

#### **5.2 View Final Results**

- **Final Result**: Display arbitration outcome
- **Voting Summary**: Show vote distribution
- **Resolution Details**: Explain final decision
- **Status**: Mark dispute as resolved

### Step 6: Asset Manager Settlement

#### **6.1 Post-Arbitration Actions**

- **Timing**: After arbitration ends
- **Action**: Asset manager can execute settlement
- **Operations**:
  - Finalize event results
  - Distribute rewards
  - Process refunds if applicable
  - Update event status

#### **6.2 Settlement Execution**

- **Authorization**: Asset manager has authority to settle
- **Verification**: System verifies arbitration completion
- **Execution**: Proceed with standard settlement process

## Core Functionality

### DAO Contract (Upgradeable + Role Control)

The DAO contract is the core smart contract that manages the entire arbitration process.

#### **1.1 Initialization**

##### **Arbitrator Authorization**

- **Purpose**: Specify which addresses have voting permissions
- **Method**: Set authorized arbitrator addresses during initialization
- **Control**: Only specified addresses can vote on disputes
- **Security**: Prevents unauthorized voting

##### **Threshold Rules**

- **Threshold**: **2-of-3** voting system
- **Meaning**: At least 2 out of 3 arbitrators must vote
- **Requirement**: Minimum 2 votes required for decision
- **Finalization**: Automatic when threshold reached

#### **1.2 Create Dispute Condition**

##### **Function**: `createCondition(address pool, uint256 conditionId, uint256 expiration)`

**Parameters**:
- `pool`: Address of the pool contract
- `conditionId`: Identifier of the condition being disputed
- `expiration`: Timestamp when arbitration expires

**Functionality**:
- **Role Permission Verification**: Checks if caller has permission to create condition
- **State Validation**: Verifies pool and condition are valid
- **Condition Creation**: Creates new dispute condition in contract
- **Status Update**: Marks condition as "in dispute"

**Access Control**:
- Only authorized administrators can call this function
- Must be called after dispute activation conditions are met

#### **1.3 Vote**

##### **Function**: `vote(uint256 conditionId, bool result)`

**Parameters**:
- `conditionId`: Identifier of the condition to vote on
- `result`: Vote choice (true = YES, false = NO)

**Functionality**:
- **Role Permission Verification**: 
  - Verifies caller is authorized arbitrator
  - Checks arbitrator address against whitelist
- **Condition State Verification**:
  - Verifies condition exists and is active
  - Checks if arbitration has ended
  - Validates expiration time hasn't passed
  - Ensures arbitrator hasn't already voted
- **Vote Recording**: Records vote in contract
- **Threshold Check**: Checks if threshold reached after vote

**Vote Restrictions**:
- Cannot vote if already voted on this condition
- Cannot vote if arbitration ended
- Cannot vote if expiration time passed
- Only authorized arbitrators can vote

#### **1.4 Finalize Result**

##### **Internal Function**: Activated when threshold reached

**Functionality**:
- **Threshold Check**: Verifies 2-of-3 threshold is met
- **Execute Finalization**: Calls `pool.finalizeResult(conditionId, result)`
- **State Update**: Updates condition status to "resolved"
- **Event Emission**: Emits arbitration completion event

**Automatic Execution**:
- Triggered automatically when voting threshold reached
- No manual intervention required
- Ensures timely resolution

**Event Details**:
- Event includes: pool address, conditionId, final result, timestamp
- Used by monitoring system to track resolution

#### **1.5 Query Functions**

##### **Query Condition Arbitration Status**

**Function**: `getConditionStatus(uint256 conditionId)`

**Returns**:
- Current arbitration status
- Number of votes cast
- Voting threshold status
- Expiration time
- Final result (if resolved)

##### **Query Dispute Condition Information**

**Function**: `getConditionInfo(uint256 conditionId)`

**Returns**:
- `pool`: Pool address
- `conditionId`: Condition identifier
- `expiration`: Expiration timestamp
- `voteCount`: Number of votes received
- `result`: Final result (if available)
- `status`: Current status (pending, active, resolved, expired)

## Access Control and Permissions

### Role-Based Access

| Role | Permissions | Restrictions |
|------|-------------|--------------|
| **Event Participant** | Submit disputes | Must meet balance and fee requirements |
| **Administrator** | Activate disputes, authorize DAO | Must verify conditions met |
| **Arbitrator** | Vote on disputes | Must be authorized, can only vote once |
| **Asset Manager** | Execute settlement | Only after arbitration completes |
| **DAO Contract** | Finalize results | Only when threshold reached |

### Permission Verification

- **On-Chain Verification**: All permissions verified on blockchain
- **Smart Contract Enforcement**: DAO contract enforces access control
- **Role Whitelisting**: Authorized addresses stored in contract
- **State-Based Restrictions**: Permissions depend on current state

## Dispute Conditions and Requirements

### User Dispute Requirements

| Requirement | Description | Validation |
|-------------|-------------|------------|
| **Event Participation** | Must be event participant | On-chain verification |
| **Vault Balance** | Must have > 10 USDT | Balance check |
| **Arbitration Fee** | Transfer 10 USDT to DAO | Transaction verification |
| **Transaction Hash** | Submit valid transaction hash | API validation |

### Dispute Activation Requirements

| Requirement | Description | Validation |
|-------------|-------------|------------|
| **Minimum Disputes** | More than 10 users disputed | Count verification |
| **Administrator Approval** | Admin must activate | Manual approval |
| **Whitelist Check** | Event creator in whitelist | Address verification |

### Arbitration Requirements

| Requirement | Description | Validation |
|-------------|-------------|------------|
| **Arbitrator Authorization** | Must be authorized voter | DAO contract check |
| **Condition Status** | Condition must be active | State verification |
| **Expiration Check** | Must be before expiration | Timestamp check |
| **Vote Status** | Must not have voted | Vote history check |

## Voting Mechanism

### 2-of-3 Threshold System

- **Minimum Votes**: 2 votes required
- **Maximum Arbitrators**: 3 authorized arbitrators
- **Decision Rule**: Majority vote determines outcome
- **Automatic Finalization**: Executes when threshold reached

### Vote Options

- **YES**: Agrees with disputed result
- **NO**: Disagrees with disputed result
- **Outcome**: Majority vote determines final result

### Vote Counting

- **Real-time Updates**: Vote count updates immediately
- **Threshold Tracking**: System tracks progress toward threshold
- **Automatic Trigger**: Finalization triggers at threshold

## Timeline and Expiration

### Arbitration Timeline

1. **Dispute Submission**: User submits dispute
2. **Activation Period**: Administrator activates (if conditions met)
3. **Voting Period**: Arbitrators cast votes
4. **Expiration**: Arbitration expires at set time
5. **Finalization**: Automatic when threshold reached or expiration

### Expiration Handling

- **Before Expiration**: Arbitrators can vote
- **After Expiration**: No new votes accepted
- **Threshold Not Met**: Dispute may require manual resolution
- **Threshold Met**: Automatic finalization before expiration

## Best Practices

### For Disputing Users

- **Verify Eligibility**: Check vault balance before disputing
- **Understand Fees**: Be aware of 10 USDT arbitration fee
- **Submit Early**: Dispute early to allow time for arbitration
- **Provide Evidence**: Include clear reasons for dispute

### For Administrators

- **Verify Conditions**: Ensure all conditions met before activation
- **Monitor Disputes**: Track dispute volume and patterns
- **Timely Activation**: Activate disputes promptly when conditions met
- **Whitelist Management**: Maintain accurate whitelist

### For Arbitrators

- **Review Carefully**: Understand dispute details before voting
- **Vote Timely**: Cast votes before expiration
- **Fair Assessment**: Vote based on evidence and rules
- **Monitor Status**: Track arbitration progress

## Troubleshooting

### Common Issues

#### **Cannot Submit Dispute**

**Problem**: Unable to submit dispute request

**Solutions**:
- Verify you are event participant
- Check vault balance is > 10 USDT
- Ensure you've transferred 10 USDT to DAO contract
- Verify transaction hash is correct
- Contact support if issue persists

#### **Dispute Not Activated**

**Problem**: Dispute submitted but not activated

**Solutions**:
- Check if minimum 10 users have disputed
- Verify event creator is in whitelist
- Wait for administrator activation
- Contact support for status update

#### **Cannot Vote**

**Problem**: Arbitrator cannot cast vote

**Solutions**:
- Verify arbitrator authorization
- Check if already voted
- Verify arbitration hasn't ended
- Check expiration time hasn't passed
- Ensure wallet is connected

#### **Arbitration Stuck**

**Problem**: Arbitration not completing

**Solutions**:
- Check if threshold reached (2-of-3)
- Verify expiration time
- Check DAO contract status
- Contact technical support

## Support

### Getting Help

For issues related to dispute resolution:

- **Help Center**: Check documentation for detailed guides
- **Live Chat**: Contact support for immediate assistance
- **Email**: support@yc365.io
- **Community**: Ask questions in community forums

### Technical Support

For technical issues with DAO contract or arbitration:

- **Developer Documentation**: Check API and contract documentation
- **Technical Support**: Contact development team
- **Bug Reports**: Submit detailed bug reports

---

**Fair and Transparent Dispute Resolution** ⚖️ The dispute resolution process ensures fair outcomes through decentralized arbitration. Submit disputes with confidence knowing that neutral arbitrators will make final decisions based on evidence and rules.

*The 2-of-3 threshold system and DAO contract automation ensure timely and fair resolution of all disputes.*

