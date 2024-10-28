# Secure Azure Infrastructure Implementation

This repository contains the implementation of a secure, multi-tier infrastructure in Azure using Virtual Machine Scale Sets (VMSS), Azure Bastion, and proper network segregation.

## Architecture
![Architecture Diagram](images/architecture-diagram.png)

## Components
- Azure Virtual Network (VNet)
- Virtual Machine Scale Set (VMSS) with Nginx
- Azure Load Balancer
- Azure Bastion
- Network Security Groups (NSGs)
- NAT Gateway

## Prerequisites
- Azure CLI installed
- Azure subscription
- Git
- Bash shell (Linux/Mac) or Git Bash (Windows)

## Implementation Steps
1. Clone this repository
```bash
git clone https://github.com/[your-username]/azure-secure-infrastructure.git
cd azure-secure-infrastructure
```

2. Run the scripts in order:
```bash
# Make scripts executable
chmod +x scripts/*.sh

# Run each script
./scripts/1-network-setup.sh
./scripts/2-security-groups.sh
./scripts/3-bastion-setup.sh
./scripts/4-vmss-setup.sh
```

## Network Security Groups (NSGs) Configuration

### Frontend Subnet NSG
- Inbound Rules:
  - Allow HTTP from internet
  - Allow HTTPS from internet
- Outbound Rules:
  - Allow traffic to Backend Subnet (80/443)

### Backend Subnet NSG
- Inbound Rules:
  - Allow HTTP/HTTPS from Frontend Subnet
  - Allow SSH from Bastion Subnet
- Outbound Rules:
  - Allow outbound internet via NAT Gateway

### Bastion Subnet NSG
- Pre-configured for Azure Bastion service

## Directory Structure
```
.
├── scripts/          # Implementation scripts
├── templates/        # Configuration templates
├── docs/            # Detailed documentation
└── images/          # Architecture diagrams
```

## Documentation
For detailed implementation guide, see [Implementation Guide](docs/implementation-guide.md)

## Contributing
Feel free to submit issues and enhancement requests.

## License
[MIT](LICENSE)

## Author
[JIBRIIL CIISE]