# Merchant Private Markets

## Background

Merchants using YC365's prediction market services can create markets with flexible access control. Merchants have the option to make markets **fully open to all users** or **restricted to only their own merchant users**, providing control over market visibility and participation.

## Overview

Merchant private markets allow merchants to create prediction markets with configurable access settings. This feature enables merchants to:
- Create public markets accessible to all YC365 users
- Create private markets restricted to their own merchant users
- Manage and query markets created by their merchant account

### Key Features

- **Access Control**: Choose between fully open or merchant-only access
- **Market Management**: Query and manage markets created by your merchant
- **User Restriction**: Limit market participation to your merchant users
- **Flexible Configuration**: Easy switching between public and private modes

## Market Access Control

### Market Visibility Options

When creating a market, merchants can choose from two access modes:

#### **1. Fully Open Market**

**Description**: Market is accessible to all YC365 users

**Characteristics**:
- **Visibility**: Appears in public market listings
- **Access**: Any YC365 user can view and participate
- **Participation**: No restrictions on who can trade
- **Discovery**: Market can be found through search and browsing

**Use Cases**:
- Public events and general predictions
- Markets intended for broad participation
- Events that benefit from maximum liquidity
- General interest topics

#### **2. Merchant-Only Market**

**Description**: Market is restricted to users belonging to the merchant

**Characteristics**:
- **Visibility**: May be hidden from public listings
- **Access**: Only merchant's own users can view and participate
- **Participation**: Restricted to merchant user base
- **Discovery**: Limited to merchant's platform or direct links

**Use Cases**:
- Exclusive events for merchant users
- Internal predictions and competitions
- Private trading groups
- Merchant-specific promotions

### Market Creation Configuration

#### **Setting Market Access**

**During Market Creation**:

1. **Navigate to Market Creation**
   - Access market creation page in Merchant Center
   - Fill in market details (title, description, conditions, etc.)

2. **Configure Access Settings**
   - Locate "Market Access" or "Visibility" section
   - Select access mode:
     - **Option 1**: Fully Open (Public)
     - **Option 2**: Merchant Only (Private)

3. **Save Configuration**
   - Review market settings
   - Confirm access mode selection
   - Submit market creation

**Access Mode Options**:

| Option | Description | User Access |
|--------|-------------|-------------|
| **Fully Open** | Market accessible to all users | All YC365 users |
| **Merchant Only** | Market restricted to merchant users | Only merchant's users |

#### **Modifying Market Access**

**After Market Creation**:

1. **Access Market Management**
   - Navigate to "My Markets" section
   - Select market to modify

2. **Update Access Settings**
   - Click "Edit Market Settings"
   - Modify access mode if needed
   - Note: Some restrictions may apply based on market status

3. **Save Changes**
   - Confirm access mode change
   - System updates market access immediately

**Important Notes**:
- Access mode can typically be changed before market starts
- Active markets may have restrictions on access changes
- Changing from public to private may affect existing participants

## Querying Merchant Markets

### Market Query Functionality

Merchants can query and view all markets created by their merchant account.

#### **Query Access**

**Scope**: Merchants can only query markets created by their own merchant account

**Access Control**:
- Cannot view markets created by other merchants
- Limited to own merchant's market data
- Data isolation between merchants

#### **Query Methods**

##### **1. Market List View**

**Function**: View all markets created by merchant

**Display Information**:
- Market ID
- Market title/name
- Market status (active, closed, resolved)
- Access mode (public/private)
- Creation date
- Participation statistics
- Trading volume

**Filter Options**:
- Filter by access mode (public/private)
- Filter by status (active, closed, resolved)
- Filter by date range
- Sort by creation date, volume, or status

##### **2. Market Detail View**

**Function**: View detailed information about specific market

**Information Displayed**:
- Complete market details
- Access mode and settings
- User participation list (if merchant-only)
- Trading activity
- Current market state
- Resolution information (if resolved)

##### **3. Search Markets**

**Function**: Search markets by various criteria

**Search Options**:
- Search by market title
- Search by market ID
- Search by keywords
- Filter by access mode
- Filter by status

#### **Query Interface**

**Location**: Merchant Center "Markets" section

**Features**:
- **Market Dashboard**: Overview of all merchant markets
- **Market List**: Comprehensive list with filters
- **Market Details**: Detailed view of individual markets
- **Statistics**: Market performance statistics
- **Export**: Export market data (if available)

### Market Statistics

#### **Market Overview**

**Statistics Available**:
- Total markets created
- Active markets count
- Closed markets count
- Public vs. private market distribution
- Total trading volume
- Average participation per market

#### **Market Performance**

**Metrics Tracked**:
- Trading volume per market
- Number of participants
- Market resolution status
- User engagement metrics
- Revenue statistics (if applicable)

## Market Management

### Managing Merchant Markets

#### **View Market Status**

- **Active Markets**: Currently open for trading
- **Closed Markets**: No longer accepting new trades
- **Resolved Markets**: Outcomes determined and settled

#### **Market Operations**

**Available Actions**:
- View market details
- Edit market settings (if allowed)
- Monitor trading activity
- View participant list
- Access market analytics
- Export market data

#### **Access Control Management**

**For Merchant-Only Markets**:
- View list of participating users
- Monitor user activity
- Manage user access (if applicable)
- Track merchant user participation

**For Public Markets**:
- View all participants
- Monitor public engagement
- Track overall market performance

## Use Cases

### Public Markets

**When to Use**:
- General interest topics
- Events with broad appeal
- Markets requiring maximum liquidity
- Public competitions or events
- General market predictions

**Benefits**:
- Maximum participation
- Higher liquidity
- Broader market discovery
- Increased trading volume

### Private Markets

**When to Use**:
- Exclusive events for merchant users
- Internal competitions
- Private trading groups
- Merchant-specific promotions
- User retention programs

**Benefits**:
- Controlled participation
- Exclusive user experience
- Targeted engagement
- Merchant brand building

## Best Practices

### Market Access Selection

#### **Choosing Public Markets**

- Use for events with broad appeal
- Maximize participation and liquidity
- Increase market visibility
- Build general engagement

#### **Choosing Private Markets**

- Use for exclusive merchant events
- Create unique user experiences
- Reward merchant users
- Build merchant community

### Market Management

- **Regular Monitoring**: Regularly check market status and performance
- **User Engagement**: Monitor user participation and activity
- **Access Review**: Periodically review access settings
- **Performance Analysis**: Analyze market performance metrics

### Query and Analytics

- **Regular Queries**: Regularly query markets to track performance
- **Data Analysis**: Use query results for business insights
- **Market Optimization**: Use data to optimize future markets
- **User Insights**: Understand user preferences and behavior

## Access Control Details

### Public Market Access

**User Access**:
- All YC365 users can view
- All YC365 users can participate
- Appears in public listings
- Discoverable through search

**Merchant Control**:
- Merchant can view all participants
- Merchant can monitor all activity
- Merchant retains market ownership

### Private Market Access

**User Access**:
- Only merchant's users can view
- Only merchant's users can participate
- May be hidden from public listings
- Accessible through merchant platform

**Merchant Control**:
- Merchant can view participant list
- Merchant can manage user access
- Merchant has full control over visibility
- Merchant can modify access settings

## Technical Implementation

### Market Access Configuration

**Configuration Fields**:
- `accessMode`: Public or Private
- `merchantId`: Merchant identifier
- `userRestriction`: User access rules
- `visibility`: Public listing visibility

### Query Functionality

**Query Parameters**:
- `merchantId`: Filter by merchant
- `accessMode`: Filter by access type
- `status`: Filter by market status
- `dateRange`: Filter by creation date

**Query Results**:
- Market list with metadata
- Market details and statistics
- User participation data
- Trading activity information

## Troubleshooting

### Common Issues

#### **Cannot Create Market**

**Problem**: Unable to create new market

**Solutions**:
- Verify merchant account is active
- Check if you have permission to create markets
- Ensure all required fields are filled
- Contact support if issue persists

#### **Cannot Change Access Mode**

**Problem**: Unable to modify market access settings

**Solutions**:
- Check if market is in active trading
- Verify market status allows changes
- Ensure you have permission to modify
- Contact support for assistance

#### **Cannot Query Markets**

**Problem**: Cannot view merchant markets

**Solutions**:
- Verify you're logged in as merchant
- Check if markets exist for your merchant
- Refresh page or try different query
- Contact support if no markets appear

#### **Users Cannot Access Private Market**

**Problem**: Merchant users cannot access private market

**Solutions**:
- Verify users belong to your merchant
- Check market access mode is set correctly
- Verify user account status
- Ensure market is active and accessible

## Support

### Getting Help

For issues related to merchant private markets:

- **Help Center**: Check documentation for detailed guides
- **Live Chat**: Contact support for immediate assistance
- **Email**: merchant-support@yc365.io
- **Technical Support**: Contact technical team for API issues

### Market Creation Assistance

For help creating markets:

- **Market Creation Guide**: Follow step-by-step guides
- **Best Practices**: Review market creation best practices
- **Support Team**: Contact support for personalized assistance

---

**Create and Manage Your Markets** 🎯 Merchant private markets give you full control over market access and participation. Choose between public markets for maximum engagement or private markets for exclusive merchant user experiences.

*Start creating markets today and manage them through the Merchant Center!*

