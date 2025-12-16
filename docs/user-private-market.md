# User Private Markets

## Background

For certain events, due to various objective and subjective reasons, users may want them to be **visible and operable only within a small, restricted circle**. Private markets allow event creators to control access and visibility, making events accessible only to invited participants.

## Overview

Private markets are a special type of custom events that provide enhanced privacy and access control. Unlike public events that are visible to all users, private markets can be restricted to specific audiences through password protection and visibility settings.

### Key Features

- **Access Control**: Password-protected event access
- **Visibility Control**: Option to hide from public event listings
- **Easy Sharing**: Share events via links with embedded passwords
- **Secure Verification**: Local password verification using MD5 hashing

## Workflow

### Step 1: Enable Private Market

1. **Access Custom Event Creation**
   - Navigate to the custom event creation page
   - Select "Create Custom Event"

2. **Enable Private Market Option**
   - Locate the "Private Market" toggle/checkbox
   - Enable the private market feature
   - Once enabled, two additional fields will appear:
     - `visibleOfPublic` (Public Visibility)
     - `Access Key` (Access Password)

### Step 2: Configure Private Market Settings

#### **Private Market Toggle**
- **Field Name**: `privateMarket`
- **Type**: Boolean toggle/checkbox
- **Requirement**: Must be enabled to access other private market fields
- **Default**: Disabled (false)

#### **Public Visibility**
- **Field Name**: `visibleOfPublic`
- **Type**: Boolean option
- **Options**:
  - `true` (Yes): Event appears in public DApp event listings
  - `false` (No): Event hidden from public listings
- **Default**: `false` (hidden)
- **Purpose**: Control whether the event is visible in the main event list

#### **Access Key**
- **Field Name**: `Access Key`
- **Type**: 6-digit numeric password
- **Format**: Exactly 6 digits (0-9)
- **Default**: Empty (no password required)
- **Purpose**: Password protection for event detail page access
- **Validation**: Required if private market is enabled

### Step 3: Create and Share Event

1. **Complete Event Creation**
   - Fill in all required event details
   - Configure private market settings
   - Submit the event creation form

2. **Get Shareable Link**
   - After successful creation, the creator receives a shareable link
   - Use "Copy Link" button to copy the event URL
   - The URL includes the access key as a parameter (if password is set)

3. **Share with Friends**
   - Share the link with intended participants
   - Password is embedded in the URL parameter
   - Recipients can access the event directly via the link

### Step 4: Access Private Event

1. **Open Shared Link**
   - Friend clicks on the shared event link
   - Browser navigates to the event detail page

2. **Password Verification (if required)**
   - If Access Key is set, password verification is required
   - System checks if password parameter exists in URL
   - If password is in URL: Auto-fill and verify automatically
   - If password not in URL: Display password input form

3. **Enter Access Key**
   - User enters the 6-digit access key
   - System validates the password locally

4. **Verification Process**
   - **Local Verification**: Password verification happens client-side
   - **MD5 Hashing**: 
     - System retrieves MD5 hash of the correct password via API
     - User input is MD5 encoded
     - Compare MD5 hashes to verify password
   - **Access Decision**:
     - ✅ **Verified**: Grant access to event detail page
     - ❌ **Failed**: Deny access, show error message

## Core Functionality

### Event Type: Private Market

Private markets introduce a new event type with enhanced privacy controls.

#### **Event Type Classification**

| Event Type | Description | Visibility | Access Control |
|------------|-------------|------------|----------------|
| **Public Event** | Official events created by platform | Always visible | No password required |
| **Custom Event (Public)** | User-created events, publicly visible | Visible in listings | No password required |
| **Custom Event (Private)** | User-created events with privacy controls | Configurable visibility | Optional password protection |

#### **Private Market Attributes**

Private market events include two additional attributes:

##### **1. visibleOfPublic (Public Visibility)**

- **Purpose**: Control whether the event appears in public DApp event listings
- **Type**: Boolean
- **Options**:
  - `true` (Yes): Event is visible in public event list
  - `false` (No): Event is hidden from public listings
- **Default**: `false` (hidden)
- **Use Case**: 
  - Hide private events from public view
  - Only accessible via direct link sharing

##### **2. Access Key (Access Password)**

- **Purpose**: Password protection for event detail page access
- **Type**: 6-digit numeric string
- **Format**: Exactly 6 digits (0-9)
- **Default**: Empty (no password required)
- **Validation**: 
  - Required format: 6 numeric digits
  - Must be set if private market is enabled
- **Use Case**:
  - Restrict access to invited participants only
  - Additional security layer for sensitive events

### Configuration Rules

#### **Availability**

- **Custom Events Only**: Private market configuration is available only for custom events
- **Official Events**: All official events are public events (always visible, no password)
- **User Control**: Users have full control over custom event privacy settings

#### **Field Dependencies**

```
privateMarket (enabled)
    ├── visibleOfPublic (appears)
    └── Access Key (appears)

privateMarket (disabled)
    ├── visibleOfPublic (hidden)
    └── Access Key (hidden)
```

#### **Default Behavior**

- **Private Market Disabled**: 
  - Event behaves as standard custom event
  - Visible in public listings (default)
  - No password protection

- **Private Market Enabled**:
  - `visibleOfPublic`: Default `false` (hidden)
  - `Access Key`: Default empty (no password)

## Password Verification

### Verification Method

#### **Local Verification Process**

1. **Pre-fetch Password Hash**
   - System calls API to retrieve MD5 hash of the correct password
   - Hash is stored temporarily for comparison

2. **User Input Processing**
   - User enters 6-digit access key
   - System MD5 encodes the user input
   - Creates hash of user-entered password

3. **Hash Comparison**
   - Compare MD5 hash of user input with stored correct hash
   - If hashes match: ✅ Verification successful
   - If hashes don't match: ❌ Verification failed

4. **Access Control**
   - **Success**: Grant access to event detail page
   - **Failure**: Show error message, deny access

### Security Considerations

- **MD5 Hashing**: Provides one-way encryption for password verification
- **Local Verification**: Reduces server load, faster response
- **URL Parameters**: Password can be embedded in URL for convenience
- **Client-Side Validation**: Immediate feedback to users

## Use Cases

### Private Trading Groups

- **Scenario**: Small group of traders want to create private prediction markets
- **Configuration**: 
  - `visibleOfPublic`: `false` (hidden from public)
  - `Access Key`: Set 6-digit password
- **Sharing**: Share link with password to group members only

### Exclusive Events

- **Scenario**: Event creator wants to limit participation to invited users
- **Configuration**:
  - `visibleOfPublic`: `true` (visible but password-protected)
  - `Access Key`: Set 6-digit password
- **Sharing**: Share link publicly, but only password holders can access

### Testing and Development

- **Scenario**: Developers testing new event features
- **Configuration**:
  - `visibleOfPublic`: `false` (hidden)
  - `Access Key`: Set for team access only
- **Sharing**: Internal team access only

## Best Practices

### Password Management

- **Strong Passwords**: Use random 6-digit combinations
- **Secure Sharing**: Share passwords through secure channels
- **Regular Updates**: Change passwords if compromised
- **Access Control**: Limit password distribution to intended participants

### Visibility Settings

- **Hidden Events**: Use `visibleOfPublic: false` for truly private events
- **Public but Protected**: Use `visibleOfPublic: true` with password for semi-private events
- **Link Sharing**: Always use shareable links with embedded passwords

### Security Recommendations

- **Password Complexity**: While 6 digits is required, encourage random combinations
- **Link Security**: Be cautious when sharing links with embedded passwords
- **Access Monitoring**: Monitor who has access to private events
- **Regular Review**: Periodically review and update access controls

## Troubleshooting

### Common Issues

#### **Cannot Access Private Event**

**Problem**: Unable to access event detail page

**Solutions**:
- Verify you have the correct access key
- Check if password is correctly embedded in URL
- Ensure you're using the shared link provided by creator
- Contact event creator for correct access key

#### **Password Not Working**

**Problem**: Entered correct password but verification fails

**Solutions**:
- Verify password is exactly 6 digits
- Check for extra spaces or characters
- Try copying password directly from shared link
- Request new access key from event creator

#### **Event Not Visible**

**Problem**: Cannot find event in public listings

**Solutions**:
- Event may have `visibleOfPublic: false` setting
- Use direct link shared by event creator
- Check if event is private market type
- Contact event creator for access link

#### **Fields Not Appearing**

**Problem**: Private market fields not visible in creation form

**Solutions**:
- Ensure you're creating a custom event (not official event)
- Enable "Private Market" toggle first
- Refresh the page if fields don't appear
- Check browser compatibility

## Support

### Getting Help

For issues related to private markets:

- **Help Center**: Check documentation for detailed guides
- **Live Chat**: Contact support for immediate assistance
- **Email**: support@yc365.io
- **Community**: Ask questions in community forums

### Feature Requests

To suggest improvements for private markets:

- **Feedback Form**: Submit feature requests through platform
- **Community Discussions**: Participate in feature discussions
- **Direct Contact**: Reach out to development team

---

**Create Private Markets Today!** 🎯 Private markets give you full control over event visibility and access. Share events with select groups while maintaining privacy and security.

*Perfect for exclusive trading groups, private events, and testing environments. Start creating your first private market now!*

