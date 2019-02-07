# Security, Privacy and How it Works FAQ

remote.it takes security and privacy very seriously, and has been architected to maximize secure connections and to hide devices from malicious activity. Here are common questions and answers about remote.it.

1. [Security](#security)
2. [Connections](#connections)
3. [Credentials](#credentials)
4. [Software and Source Code](#software)
5. [Cloaking and Scanning](#cloaking)
6. [Network](#network)
7. [Privacy](#privacy)
8. [How Does remote.it Work?](#how)
9. [remote.it API’s](#api)
10. [Encryption](#encryption)
11. [Device Lifecycle](#lifecycle)

## Security

### What security threat model does remote.it use?

The remote.it threat model is to protect against unauthorized network access, but not against attacks with physical access. Our highest security focus is on our Core Connection Technology. Other key technologies use best practices and enable the Core Connection Technology. These other technologies could be partner provided. Separately, we use an SDL Threat Model.

[See Wikipedia: Threat Model](https://en.wikipedia.org/wiki/Threat_model)

### Are specific assets and adversaries documented anywhere, along with specific security objectives?

We do not use a formal model. The closest standard threat model would be STRIDE (see for example Application Threat Modeling). We focus on the following:

- Protect device from unauthorized remote access. We cannot protect the device from someone with physical access.
- Separate websites into two domains: Company and business is separate from device access web portal. We focus protection on the service website and separate the access website from the company website.
- Protect device access web portal from unauthorized access.
- Use commercial best practices.
- Avoid known problems and issues.
- Monitor CERTs etc. for new problems and issues.
- Use simplest solution that is compatible with best practices.

### What is the attack surface?

User account. Encrypted traffic. Configuration process. Configuration files. Partner changes to remote.it architecture. remote.it servers serving device access.

### What does remote.it protect against?

What does remote.it protect against?

### What does remote.it protect against?

Devices on network with open credentials (admin and password) and open ports

### What does remote.it see as the most important security features and requirements?

Core technology is the local and remote access to devices from anywhere. Key technologies that enable core technology include secure provisioning.

### How would remote.it work with PKI hardware solutions provided by partners?

We see remote.it Core Connection Technology as complementary. Any TCP service will run over remote.it Core Connection Technology.

Public-key infrastructure (PKI), see Wikipedia [Public Key Infrastructure](https://en.wikipedia.org/wiki/Public_key_infrastructure)
PKI hardware, and hardware security module (HSM), see Wikipedia Hardware Security Module

### Describe remote.it security related to the remote.it website(s)

The remote.it web functions are divided into two parts:

1. The remote.it website located at https://www.remote.it and https://www.remot3.it is responsible for handling customer facing functions such as company information, policies, pricing information and general marketing content such as product information. This remote.it site does not handle any device communication functions. This remote.it site does not store or handle any user device related data. This site has been scanned for high-risk vulnerabilities. This remote.it site uses standard https TLS 1.2 encryption for all communications.

2. The remote.it developer website located at https://app.remote.it is responsible for handling connections between users and devices. This site uses standard https TLS 1.2 encryption for all communications. This site is scanned regularly using vulnerability tools including OWASP ZAP and Vega. Security policy is to eliminate at least all high and medium vulnerabilities. Payment, credit-card information etc. is handled completely separately by secure and independently verified third-party functions from [Stripe](https://stripe.com/).

### Describe security related to connections to the devices enabled with remote.it software

Communications links between users and devices are protected by several layers of security. The remote.it communications protocol tunnels employ standard encrypted connections inside a layer further protected by a selectable set of standard encryption suites. The keys for this outer layer are generated on a per-session basis. The inner layer of encryption varies based on the type of traffic.

For example all tunneled web traffic is encrypted using standard TLS 1.2 suites, certificates and keying functions; all ssh traffic is encrypted using standard TLS 1.2 protocols and functions; similarly other traffic is protected by appropriate standard encryption corresponding to the protocol used. remote.it traffic is thus at least as secure as the tunneled traffic.