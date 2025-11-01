!!! note "หมายเหตุการแปล"
    หน้านี้กำลังอยู่ระหว่างการแปลเป็นภาษาไทย เนื้อหาด้านล่างเป็นต้นฉบับภาษาอังกฤษเพื่อให้เข้าถึงข้อมูลได้ทันที

# System Architecture

## Overview

YC365 is built on a modular architecture with each component handling specific responsibilities while working together to provide a comprehensive prediction market platform. The system is designed for transparency, security, and scalability.

## Architecture Overview

### Core Components

#### 1. Smart Contracts (BSC Chain)
- **LP Contract Set**: Manages liquidity pools for each condition
- **DP Contract Set**: Handles event/condition publishing and results
- **Vault Contract Set**: Manages user deposits and withdrawals
- **Trading Contract Set**: Executes buy/sell transactions
- **Factory Contract Set**: Manages events, conditions, and permissions
- **Temporary Condition Contracts**: Individual condition-specific contracts

#### 2. Data Provider (DP)
- **Event Management**: Event types, creation, and publishing
- **Condition Management**: Condition creation and chain operations
- **Permission Management**: Role-based access control
- **API Services**: External data query services

#### 3. Order Trading Model
- **Order Book**: Manages limit orders
- **Matching Engine**: Price and time priority matching
- **Market Price**: Real-time price calculation
- **Settlement Service**: Off-chain calculation, on-chain execution

#### 4. DApp Backend Service
- **User Management**: Wallet-based login/registration
- **Analytics**: Historical data and trend analysis
- **Dashboard**: User statistics and performance metrics
- **Search & Graph**: Event search and price trend visualization

#### 5. DApp Frontend
- **User Interface**: Intuitive trading and management interface
- **Multi-language Support**: Traditional Chinese and English
- **Real-time Updates**: Live price and order updates

## Smart Contract Architecture

### 1. LP Contract Set

#### Core Functions:
- **Liquidity Pool Management**: Independent pools for each condition's YES/NO tokens
- **TVL Management**: Stablecoin deposits from DP and users
- **Order Processing**: Buy/sell order execution
- **Settlement**: Profit distribution and NO token liquidation

#### Key Features:
- **Independent Pools**: Each condition has its own liquidity pool
- **Automatic Settlement**: Triggered settlement processing
- **Profit Distribution**: YES token holders receive 1 USDT per token
- **NO Token Liquidation**: NO tokens become worthless

### 2. DP Contract Set

#### Event Management:
- **Event Publishing**: Deploy events and conditions to chain
- **Condition Initialization**: Set initial odds and liquidity
- **Result Publishing**: Publish event outcomes
- **Liquidity Management**: Add or recover liquidity

#### Permission System:
- **Role-based Access**: Different permissions for different roles
- **No Super Admin**: Distributed authority model
- **Specific Permissions**: Address-based permission management

### 3. Vault Contract Set

#### Asset Management:
- **DP Deposits**: Data provider deposit/withdrawal management
- **User Deposits**: Regular user deposit/withdrawal management
- **Reward Distribution**: User reward allocation
- **Token Management**: YES/NO token custody (under consideration)

#### Security Features:
- **Audited Contracts**: All contracts undergo security audits
- **Open Source**: Transparent and verifiable code
- **Risk Assessment**: Users maintain full control of assets

### 4. Trading Contract Set

#### Transaction Processing:
- **Transfer Function**: Execute YES/NO token trades
- **Order Service Integration**: Triggered by order service
- **Asset Freezing**: Temporary asset locks for orders
- **Batch Processing**: Efficient bulk transaction execution

#### Trading Restrictions:
- **Pre-result Trading**: Trading stops 1 hour before results
- **Identity Verification**: Private key signature verification
- **Order Validation**: Order service authentication

### 5. Factory Contract Set

#### Management Functions:
- **Event/Condition Management**: Publish or delete events and conditions
- **Permission Management**: Set permission addresses
- **User Management**: Define different user roles
- **Contract Deployment**: Deploy temporary condition contracts

#### User Roles:
- **DP Chain Operators**: Data provider chain operations
- **Order Operators**: Order book transaction submission
- **Regular Users**: Deposit, withdrawal, order placement

### 6. Temporary Condition Contracts

#### Individual Contracts:
- **Condition-specific Services**: Each condition gets its own contract
- **YES/NO Token Management**: Token creation and destruction
- **TVL Management**: Condition-specific total value locked
- **Settlement Implementation**: Specific liquidation logic

#### Design Considerations:
- **Modular Design**: Independent contract for each condition
- **Service Integration**: Called by other contracts, not directly by users
- **Gas Optimization**: Efficient contract design for BSC

## Data Provider (DP) System

### 1. Event Type Management

#### Core Functions:
- **Type Creation**: Add and manage event categories
- **Classification System**: All events belong to specific types
- **Import/Export**: Batch import and export capabilities
- **Data Maintenance**: Type data management and updates

### 2. Event Management

#### Event Operations:
- **Manual Entry**: Admin user manual event creation
- **Batch Import**: External file bulk import
- **Data Validation**: Event data verification
- **Chain Publishing**: Blockchain event deployment

#### Publishing Process:
- **Event Creation**: Define event parameters
- **Condition Setup**: Create event conditions
- **Liquidity Initialization**: Set initial odds and liquidity
- **Market Launch**: Enable trading for the event

### 3. Chain Operations

#### DP Functions:
- **Event Publishing**: Deploy events to blockchain
- **Condition Management**: Create and manage conditions
- **Liquidity Operations**: Add or recover liquidity
- **Result Publishing**: Publish event outcomes
- **Settlement Execution**: Trigger liquidation process

#### Automated Services:
- **Scheduled Operations**: Automatic execution of specific tasks
- **Trading Halts**: Automatic condition trading stops
- **Result Publishing**: Automatic result publication
- **Settlement Processing**: Automatic liquidation execution

### 4. Permission Management

#### Role-based Access:
- **Administrators**: Manage other account permissions and contract configuration
- **Data Entry Staff**: Event/condition data entry and maintenance
- **Asset Managers**: Chain operations and operations management

#### Security Features:
- **Specific Permissions**: Only authorized users can operate chain data
- **Transaction Confirmation**: Wait for transaction confirmation before next step
- **Permission Auditing**: Regular permission review and updates

## Order Trading Model

### 1. Order Book Management

#### Core Functions:
- **Limit Order Support**: Only limit orders currently supported
- **Order Storage**: Efficient order data management
- **Order Matching**: Price and time priority matching
- **Order Validation**: Order integrity verification

#### Technical Considerations:
- **Single Cluster**: No distributed deployment requirements
- **Performance**: TPS < 100
- **Scalability**: Future expansion considerations

### 2. Matching Engine

#### Matching Principles:
- **Price Priority**: Better prices matched first
- **Time Priority**: Earlier orders matched first
- **Order Types**: Currently only limit orders
- **Real-time Processing**: Immediate order processing

#### Engine Features:
- **Efficient Matching**: Optimized matching algorithms
- **Order Validation**: Pre-matching order verification
- **Settlement Integration**: Seamless settlement processing

### 3. Market Price Calculation

#### Price Determination:
- **Seller-based Pricing**: Minimum seller price as market price
- **Future Enhancements**: Comprehensive price calculation
- **Real-time Updates**: Continuous price updates
- **Historical Data**: Price history tracking

#### Calculation Factors:
- **Current Version**: Minimum seller price
- **Future Version**: Comprehensive calculation including:
  - Transaction prices
  - Trading volume
  - Buyer prices
  - Market depth

### 4. Settlement Service

#### Settlement Process:
- **Off-chain Calculation**: Settlement calculations performed off-chain
- **On-chain Execution**: Asset changes executed on blockchain
- **Batch Processing**: Efficient bulk transaction processing
- **Verification**: Settlement result verification

#### Security Features:
- **Transaction Verification**: All transactions verified on-chain
- **Asset Safety**: User assets protected throughout process
- **Audit Trail**: Complete transaction history

## DApp Backend Service

### 1. User Management

#### Authentication:
- **Wallet Connection**: Connect wallet for login/registration
- **SSO Support**: Single sign-on integration
- **User Settings**: User preference management
- **Overview Module**: User dashboard and statistics

#### User Features:
- **Profile Management**: User profile and settings
- **Activity Tracking**: User activity monitoring
- **Performance Analytics**: User performance metrics

### 2. Activity Module

#### Admin Configuration:
- **Activity Management**: Direct admin configuration
- **Image Management**: Activity image address management
- **Link Management**: Activity link address management
- **API Integration**: Client-side activity data provision

#### Features:
- **Dynamic Content**: Configurable activity content
- **Image Display**: Activity image presentation
- **Link Handling**: External link management
- **API Services**: Activity data API provision

### 3. Historical Order Management

#### Order History:
- **Time Filtering**: Filter orders by time period
- **Status Filtering**: Filter orders by status
- **Event Filtering**: Filter orders by event
- **Comprehensive Search**: Multi-criteria order search

#### Data Integration:
- **Order Book API**: Basic API from order book service
- **Data Aggregation**: Comprehensive order data collection
- **User Interface**: User-friendly order history display

### 4. Dashboard Module

#### Deposit Analytics:
- **Deposit Trends**: Deposit amount trend charts
- **Data Collection**: 30-second contract reading intervals
- **Event Monitoring**: Vault contract deposit/withdraw event monitoring
- **Profit Calculation**: Comprehensive profit calculation

#### Revenue Analytics:
- **Profit Trends**: Profit amount trend charts
- **Real-time Updates**: Live profit calculation
- **Historical Data**: Complete profit history
- **Performance Metrics**: User performance analysis

#### Activity Analytics:
- **Order Volume Trends**: Daily order volume charts
- **Order Amount Trends**: Daily order amount charts
- **Event Monitoring**: SubmitOrderEvent monitoring
- **Data Analysis**: Comprehensive order data analysis

### 5. Search and Graph Services

#### Search Functionality:
- **Keyword Search**: Search all related events
- **DP Service Integration**: Basic API from DP service
- **Advanced Filtering**: Multi-criteria search
- **Real-time Results**: Instant search results

#### Graph Services:
- **Price Trend Charts**: Market price trend visualization
- **Time Intervals**: 30-minute, 1-hour, 1-day, 1-week statistics
- **Data Collection**: 10-minute API data collection intervals
- **Price Analysis**: Comprehensive price data analysis

## DApp Frontend

### 1. User Interface

#### Core Features:
- **Simple Design**: Intuitive and user-friendly interface
- **Trustworthy Experience**: Transparent and reliable service
- **Real-time Updates**: Live data updates
- **Responsive Design**: Mobile and desktop compatibility

#### User Experience:
- **Easy Navigation**: Simple and clear navigation
- **Visual Feedback**: Clear visual indicators
- **Error Handling**: Comprehensive error management
- **Loading States**: Clear loading indicators

### 2. Authentication System

#### Login Methods:
- **Wallet Connection**: MetaMask and other EVM wallets
- **SSO Integration**: Single sign-on support
- **Registration Process**: Simple user registration
- **Session Management**: Secure session handling

#### Security Features:
- **Private Key Security**: Secure private key handling
- **Transaction Signing**: Secure transaction signing
- **Identity Verification**: User identity verification

### 3. Asset Management

#### Deposit/Withdrawal:
- **Asset Viewing**: View user assets by address
- **Deposit Function**: Simple deposit process
- **Withdrawal Function**: Secure withdrawal process
- **Balance Tracking**: Real-time balance updates

#### Asset Features:
- **Multi-asset Support**: Support for various assets
- **Transaction History**: Complete transaction records
- **Asset Analytics**: Asset performance analysis

### 4. Personal Center

#### User Dashboard:
- **Personal Overview**: Comprehensive user overview
- **My Orders**: User order management
- **Settings**: User preference settings
- **Performance Tracking**: User performance metrics

#### Management Features:
- **Order History**: Complete order history
- **Asset Management**: Asset overview and management
- **Settings Configuration**: User settings and preferences

### 5. Limit Order Trading

#### Order Features:
- **Buy/Sell Orders**: Submit buy and sell orders
- **Market Price View**: Real-time market price display
- **Price Trends**: Price trend visualization
- **Order Book Details**: Detailed order book information

#### Trading Interface:
- **Order Placement**: Simple order placement
- **Price Charts**: Real-time price charts
- **Order Management**: Order modification and cancellation
- **Trade History**: Complete trade history

### 6. Event Management

#### Event Services:
- **Event Lists**: Comprehensive event listings
- **Event Filtering**: Advanced event filtering
- **Event Search**: Event search functionality
- **Event Details**: Detailed event information

#### Condition Management:
- **Condition Lists**: Event condition listings
- **Price Information**: Real-time price data
- **Order Book Details**: Detailed order book information
- **Market Price Trends**: Price trend visualization

### 7. Data Analytics

#### Trend Analysis:
- **Deposit Trends**: Deposit amount trend charts
- **Profit Trends**: Profit amount trend charts
- **Activity Trends**: Order volume and amount trends
- **Performance Metrics**: User performance analysis

#### Visualization:
- **Interactive Charts**: Interactive data visualization
- **Real-time Updates**: Live data updates
- **Historical Analysis**: Historical data analysis
- **Custom Timeframes**: Flexible time period selection

### 8. Multi-language Support

#### Language Options:
- **English**: English language support (default)
- **Simplified Chinese**: Simplified Chinese language support
- **Traditional Chinese**: Traditional Chinese language support
- **Thai**: Thai language support
- **Indonesian**: Indonesian language support
- **Vietnamese**: Vietnamese language support

#### Localization Features:
- **Dynamic Translation**: Real-time language switching
- **Cultural Adaptation**: Localized content and design
- **User Preferences**: User language preference settings
- **Regional Content**: Region-specific content and features

## Revenue Model

### 1. Transaction Fees

#### Fee Structure:
- **Trading Fee**: 1.5/1000 (0.15%) of transaction amount
- **Buyer/Seller Split**: Both parties charged the fee
- **Automatic Deduction**: Fees automatically deducted from transactions
- **Revenue Distribution**: Platform revenue distribution

#### Fee Collection:
- **Automatic Processing**: Automatic fee collection
- **Transparent Pricing**: Clear fee structure
- **Revenue Tracking**: Comprehensive revenue tracking
- **Platform Sustainability**: Revenue for platform development

## System Limitations and Risks

### 1. Technical Limitations

#### Performance Constraints:
- **Contract TPS**: < 500 transactions per second
- **Order System TPS**: < 100 transactions per second
- **Centralization Risk**: Event results determined by DP
- **Liquidity Management**: Operator-provided liquidity only

#### Current Restrictions:
- **Limit Orders Only**: No market orders currently supported
- **No Internal Wallet**: Direct use of market wallets (MetaMask)
- **No Risk Control**: Risk control system not implemented
- **Single Cluster**: No distributed deployment

### 2. Security Considerations

#### Contract Security:
- **Vulnerability Risk**: Smart contract vulnerability potential
- **Audit Requirements**: Comprehensive security audits
- **Open Source**: Transparent code for community review
- **Regular Updates**: Continuous security improvements

#### Operational Security:
- **Permission Management**: Strict permission controls
- **Transaction Verification**: All transactions verified
- **Asset Protection**: User asset security measures
- **Monitoring Systems**: Continuous security monitoring

### 3. Risk Mitigation

#### Technical Measures:
- **Comprehensive Testing**: Extensive testing procedures
- **Security Audits**: Regular security audits
- **Code Reviews**: Thorough code review processes
- **Backup Systems**: Redundant system implementations

#### Operational Measures:
- **Risk Assessment**: Regular risk assessments
- **Incident Response**: Comprehensive incident response plans
- **User Education**: User security education
- **Community Oversight**: Community monitoring and feedback

---

*For the latest information on system architecture and updates, please check our official announcements.* 