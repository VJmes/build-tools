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

### buildFilesystem.bsh

Builds a custom filesystem in alternate-disk mode where specific mountings are put on a seperate disk for performance, security or portability/backup reasons. At a minimum this will create a swap based on total physical memory and perform numerous helpful filesystem tweaks and adjustments.

#### Usage

```bash
buildFilesystem.bsh <block-device>
```

### motd.sh

A very simple MOTD (Message of the day) script I use to get a snapshot of a host's information at login.