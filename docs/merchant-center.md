# Merchant Center

## Background

YC365, as a prediction service provider, offers prediction services to third-party businesses, which is one of our key business expansion directions. Therefore, a **merchant management system** is essential and valuable. Through this system, merchants can manage and understand users, assets, permissions, security, and more.

## Overview

The Merchant Center is a comprehensive management platform that enables merchants to integrate YC365's prediction market services into their own platforms. It provides tools for managing users, assets, permissions, API keys, and various business operations.

### Key Benefits

- **Service Integration**: Integrate prediction market services into your platform
- **User Management**: Manage and track your users
- **Asset Control**: Monitor and control merchant assets
- **API Management**: Manage API keys and track usage
- **Security Control**: Configure access permissions and security settings

## Merchant Center Wireframe

For visual reference of the Merchant Center interface, please view the wireframe:

**👉 [Merchant Center Wireframe](https://merchant-client-git-main-vikes-projects-7b1b12fb.vercel.app?_vercel_share=J79Uosf4cLaUE9oQv2DXH09J2pAiYvj7)**

## Core Features

### 0. Login and Registration

#### **Login**

**Login Parameters**:
- **Merchant Name**: Name of the merchant account
- **Account**: Account identifier/username
- **Role**: User role (System Administrator or Business Administrator)
- **Password**: Account password

**Login Process**:
1. Navigate to Merchant Center login page
2. Enter merchant name, account, role, and password
3. Click "Login" to access the system
4. System verifies credentials and grants access

**Security**:
- Secure authentication process
- Session management
- Role-based access control

#### **Registration**

**Registration Process**:
- **Contact YC365**: Merchants must contact YC365 to register
- **YC365 Registration**: YC365 creates the system administrator account for the merchant
- **Initial Setup**: YC365 provides initial credentials and setup instructions
- **Account Activation**: Merchant receives account details after registration

**Requirements**:
- Business verification may be required
- Agreement to terms and conditions
- Initial setup and configuration

### 1. Roles and Permissions

The Merchant Center uses a two-tier role system to manage access and operations.

#### **System Administrator**

**Responsibilities**:
- Create business administrators
- Authorize business administrator permissions
- Manage system-level settings
- Handle merchant assets (deposit/withdraw)
- Reset business administrator accounts

**Permissions**:
- Full system access
- User management (create, modify, delete business administrators)
- Asset management (deposit, withdraw)
- Permission configuration
- System settings

#### **Business Administrator**

**Responsibilities**:
- View and operate business data
- Configure sign services
- Query merchant assets
- Query merchant users
- Manage API keys
- View and distribute points
- Modify domain and callback addresses

**Permissions**:
- Business data access (read and write)
- Configuration management
- Query operations
- API key management
- Limited to own merchant data

### 2. System Administrator Functions

#### **2.1 Create Business Administrator**

**Function**: Create and initialize business administrator accounts

**Process**:
1. Navigate to "User Management" section
2. Click "Create Business Administrator"
3. Enter account details:
   - Account name/identifier
   - Initial password
   - Email (optional)
4. Set initial permissions
5. Submit to create account

**Initialization**:
- Account is created with specified credentials
- Initial permissions are assigned
- Account is ready for use immediately

#### **2.2 Reset Business Administrator Account**

**Function**: Reset business administrator account and password

**Process**:
1. Navigate to "User Management" section
2. Select business administrator account
3. Click "Reset Account"
4. Enter new account details:
   - New account identifier (if changing)
   - New password
5. Confirm reset operation
6. Account is updated with new credentials

**Security**:
- Reset requires system administrator authorization
- Old credentials are invalidated
- New credentials are immediately active

#### **2.3 Set Business Administrator Permissions**

**Function**: Configure operation permissions for business administrators

**Permission Categories**:
- **Data Access**: What data can be viewed
- **Operations**: What operations can be performed
- **Configuration**: What settings can be modified
- **API Management**: API key management permissions

**Process**:
1. Navigate to "User Management" section
2. Select business administrator account
3. Click "Set Permissions"
4. Configure permissions for each category
5. Save permission settings

**Permission Options**:
- Full access
- Read-only access
- Limited operations
- Custom permissions

#### **2.4 Deposit and Withdraw**

**Function**: Deposit and withdraw operations for merchant address

##### **Deposit**

**Process**:
1. Navigate to "Asset Management" section
2. Click "Deposit"
3. Enter deposit amount
4. Select payment method
5. Confirm deposit transaction
6. Funds are added to merchant address

**Security**:
- Transaction verification required
- Multi-factor authentication for large amounts
- Transaction history tracking

##### **Withdraw**

**Process**:
1. Navigate to "Asset Management" section
2. Click "Withdraw"
3. Enter withdrawal amount
4. **Withdraw Address**: Must be the same merchant address
5. Confirm withdrawal transaction
6. Funds are transferred to merchant address

**Security Requirements**:
- **Address Validation**: Withdraw address must match merchant address
- **Address Lock**: Withdraw address cannot be changed (security measure)
- **Transaction Verification**: Multi-step verification process
- **Audit Trail**: All withdrawals are logged and auditable

**Important Security Note**:
- The withdraw recipient address is fixed to the merchant address
- This ensures security and prevents unauthorized address changes
- Address cannot be modified after initial setup

### 3. Business Administrator Functions

#### **3.1 Configure Sign Service**

**Purpose**: Configure sign service access path for private deployments

##### **Configure Sign Access Path**

**Requirement**: If sign service is privately deployed, you must configure the sign access path

**Configuration Requirements**:
- **Security**: Sign service must be secure
- **Reliability**: Sign service must be reliable
- **Stability**: Sign service must be stable
- **Service Quality**: Must provide quality signature services

**Process**:
1. Navigate to "Sign Service Configuration" section
2. Click "Add Sign URL"
3. Enter sign service URL
4. Test connection to verify accessibility
5. Save configuration

**Configuration Options**:
- **Sign URL**: Full URL path to sign service
- **Service Type**: Public or private deployment
- **Authentication**: API keys or tokens if required
- **Test Connection**: Verify service is accessible

##### **Modify Sign URL**

**Process**:
1. Navigate to "Sign Service Configuration" section
2. Select existing sign URL
3. Click "Edit"
4. Modify URL or settings
5. Test updated connection
6. Save changes

##### **Delete Sign URL**

**Process**:
1. Navigate to "Sign Service Configuration" section
2. Select sign URL to delete
3. Click "Delete"
4. Confirm deletion

**Important Constraint**:
- **At Least One Active URL**: Must ensure there is **one and only one** active sign URL
- **Service Continuity**: Cannot delete the last remaining sign URL
- **Validation**: System validates at least one URL exists before allowing deletion

#### **3.2 Query Merchant Assets**

**Purpose**: View merchant asset information and status

##### **Total Assets**

**Display**: Total merchant assets value

**Information Shown**:
- Total asset amount (USDT or equivalent)
- Asset breakdown by type
- Historical asset trends
- Asset growth statistics

##### **Used Assets**

**Display**: Assets currently in use

**Information Shown**:
- Amount of assets currently allocated
- Active positions
- Pending transactions
- Locked assets

##### **Remaining Assets**

**Display**: Available assets for use

**Information Shown**:
- Available balance
- Usable amount
- Reserved assets
- Free assets

**Query Features**:
- Real-time asset updates
- Historical asset tracking
- Asset breakdown by category
- Export asset reports

#### **3.3 Query Merchant Users**

**Purpose**: View and manage users under the merchant account

##### **Query Users**

**Access**: Business administrators can only query users under their own merchant account

**Query Options**:
- Search by user ID
- Search by username
- Filter by registration date
- Filter by activity status
- Sort by various criteria

**User Information Displayed**:
- User ID
- Username
- Registration date
- Account status
- Activity statistics
- Asset information

##### **Query User Orders**

**Function**: View orders placed by merchant users

**Query Options**:
- Search by user ID
- Search by order ID
- Filter by order status
- Filter by date range
- Filter by order type

**Order Information Displayed**:
- Order ID
- User information
- Order type
- Order amount
- Order status
- Transaction time
- Settlement information

**Access Control**:
- Limited to own merchant users only
- Cannot access other merchants' user data
- Data isolation between merchants

#### **3.4 API Key Management**

**Purpose**: Manage API keys for merchant integrations

##### **View API Keys**

**Function**: View all API keys under the merchant account

**Information Displayed**:
- API Key identifier
- Creation date
- Status (active/inactive)
- Usage statistics
- Last used date
- Expiration date (if applicable)

**View Options**:
- List all keys
- Filter by status
- Sort by creation date
- Sort by usage

##### **Reset API Key**

**Function**: Create or reset API key

**Key Limitation**:
- **One Key Per Merchant**: Each merchant can create **one API key**
- **Reset Function**: Can reset existing key to generate new key
- **Old Key Invalidation**: Old key is invalidated when reset

**Process**:
1. Navigate to "API Key Management" section
2. Click "Create Key" or "Reset Key"
3. Confirm key generation
4. Copy and securely store the new key
5. Old key (if exists) is immediately invalidated

**Security**:
- Key is shown only once during creation
- Store key securely
- Key cannot be retrieved after creation
- Reset requires confirmation

##### **Statistics for Each Key**

**Function**: Track and view API key usage statistics

**Statistics Displayed**:
- **Traffic Volume**: Total API requests
- **Request Count**: Number of API calls
- **Success Rate**: Percentage of successful requests
- **Error Rate**: Percentage of failed requests
- **Bandwidth Usage**: Data transfer volume
- **Time-based Statistics**: Usage by hour/day/month

**Statistics Features**:
- Real-time traffic monitoring
- Historical usage trends
- Traffic breakdown by endpoint
- Export statistics reports
- Set usage alerts

#### **3.5 View Points**

**Purpose**: View and manage merchant points

##### **View Merchant Points**

**Function**: View total points balance for the merchant

**Information Displayed**:
- Total points balance
- Points earned
- Points distributed
- Points history
- Points trends

##### **Distribute Points to Users**

**Function**: Allocate points to merchant users

**Process**:
1. Navigate to "Points Management" section
2. Click "Distribute Points"
3. Select target user(s)
4. Enter points amount
5. Add distribution reason (optional)
6. Confirm distribution

**Distribution Options**:
- **Single User**: Distribute to one user
- **Multiple Users**: Distribute to multiple users
- **Bulk Distribution**: Distribute to user groups
- **Custom Amount**: Set different amounts per user

**Validation**:
- Check merchant has sufficient points
- Verify user belongs to merchant
- Confirm distribution amount
- Record distribution in history

#### **3.6 Modify Domain and Callback Address**

**Purpose**: Update merchant domain and callback URL configurations

##### **Modify Domain**

**Function**: Update merchant domain settings

**Process**:
1. Navigate to "Domain Configuration" section
2. Click "Modify Domain"
3. Enter new domain
4. Verify domain ownership (if required)
5. Save domain configuration

**Domain Settings**:
- Primary domain
- Subdomain configuration
- SSL certificate status
- Domain verification

##### **Modify Callback Address**

**Function**: Update callback URL for webhooks and notifications

**Process**:
1. Navigate to "Callback Configuration" section
2. Click "Modify Callback Address"
3. Enter new callback URL
4. Test callback connection
5. Save callback configuration

**Callback Settings**:
- Callback URL
- Callback method (POST/GET)
- Authentication settings
- Retry configuration
- Callback events selection

**Security**:
- URL validation required
- HTTPS recommended
- Authentication token configuration
- Test callback before saving

## Access Control

### Role-Based Access Control

| Feature | System Administrator | Business Administrator |
|---------|---------------------|----------------------|
| **Create Business Admin** | ✅ Full Access | ❌ No Access |
| **Reset Business Admin** | ✅ Full Access | ❌ No Access |
| **Set Permissions** | ✅ Full Access | ❌ No Access |
| **Deposit/Withdraw** | ✅ Full Access | ❌ No Access |
| **Configure Sign Service** | ✅ View Only | ✅ Full Access |
| **Query Assets** | ✅ Full Access | ✅ Own Merchant Only |
| **Query Users** | ✅ All Merchants | ✅ Own Merchant Only |
| **API Key Management** | ✅ View Only | ✅ Full Access |
| **Points Management** | ✅ View Only | ✅ Full Access |
| **Domain/Callback Config** | ✅ View Only | ✅ Full Access |

## Security Features

### Authentication

- **Secure Login**: Encrypted password authentication
- **Session Management**: Secure session handling
- **Role Verification**: Role-based access control
- **Multi-Factor Authentication**: Optional 2FA for sensitive operations

### Data Security

- **Data Isolation**: Merchant data is isolated
- **Access Logging**: All operations are logged
- **Audit Trail**: Complete audit trail for compliance
- **Encryption**: Data encryption at rest and in transit

### Asset Security

- **Address Locking**: Withdraw address cannot be changed
- **Transaction Verification**: Multi-step verification for withdrawals
- **Balance Monitoring**: Real-time balance monitoring
- **Anomaly Detection**: Unusual activity detection

## Best Practices

### For System Administrators

- **Regular Audits**: Regularly audit business administrator accounts
- **Permission Management**: Grant minimum necessary permissions
- **Security Monitoring**: Monitor for suspicious activities
- **Backup Credentials**: Securely store backup credentials

### For Business Administrators

- **Sign Service**: Ensure sign service is secure and reliable
- **API Key Security**: Store API keys securely, never share
- **User Management**: Regularly review user activities
- **Points Distribution**: Use points distribution strategically
- **Domain Security**: Keep domain and callback URLs secure

### Security Recommendations

- **Strong Passwords**: Use strong, unique passwords
- **Regular Updates**: Keep configurations up to date
- **Access Control**: Limit access to necessary personnel only
- **Monitoring**: Regularly monitor system activities
- **Backup**: Maintain backups of important configurations

## Troubleshooting

### Common Issues

#### **Cannot Login**

**Problem**: Unable to login to Merchant Center

**Solutions**:
- Verify merchant name, account, role, and password are correct
- Check if account is active
- Contact YC365 support if account is locked
- Try password reset if available

#### **Permission Denied**

**Problem**: Cannot access certain features

**Solutions**:
- Verify your role has required permissions
- Contact system administrator to grant permissions
- Check if feature is available for your role
- Review permission settings

#### **Sign Service Not Working**

**Problem**: Sign service configuration not working

**Solutions**:
- Verify sign URL is correct and accessible
- Check if sign service is running
- Test connection to sign service
- Ensure at least one sign URL is active
- Verify authentication credentials

#### **API Key Issues**

**Problem**: API key not working or cannot create

**Solutions**:
- Verify you haven't exceeded key limit (1 key per merchant)
- Check if key is active
- Reset key if necessary
- Verify API key format is correct
- Check usage statistics for errors

#### **Asset Query Issues**

**Problem**: Cannot view asset information

**Solutions**:
- Verify you have permission to view assets
- Check if merchant address is configured
- Refresh page to update data
- Contact support if data seems incorrect

## Support

### Getting Help

For issues related to Merchant Center:

- **Help Center**: Check documentation for detailed guides
- **Live Chat**: Contact support for immediate assistance
- **Email**: merchant-support@yc365.io
- **Technical Support**: Contact technical team for API issues

### Registration and Setup

To register as a merchant:

- **Contact YC365**: Reach out to YC365 business team
- **Business Verification**: Complete business verification process
- **Account Setup**: YC365 will create your system administrator account
- **Initial Configuration**: Complete initial setup and configuration

---

**Manage Your Merchant Account Efficiently** 🏢 The Merchant Center provides comprehensive tools for managing your prediction market services integration. From user management to asset control, everything you need is in one place.

*Start managing your merchant account today and integrate YC365's prediction services into your platform!*

