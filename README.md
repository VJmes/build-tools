# 🛠️ Build Tools

Build Tools performs the first-stage configuration of a clean linux install along with somestatus scripts I use regularly.

> [!NOTE]
> This is still an in-progress migration & (partial) rewrite of old code.

---

### buildInitial.bsh

Performs the initial round of system configuration, allowing for the installation of a standard set of packages, pulls down helpful customization repositories and sets up a basic administrator account to work with.

#### Usage

```bash
buildInitial.bsh [hostname.fqdn] [username] <timezone>
```

### motd.sh

A very simple MOTD (Message of the day) script I use to get a snapshot of a host's information on login.