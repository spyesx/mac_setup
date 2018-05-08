# File System

## OSXFUSE

```bash
brew cask install osxfuse
```

## NTFS


```bash
brew install ntfs-3g
```


## SSHFS


```bash
brew install sshfs
```

Mount a volume in a folder you've created.

```
mkdir -p ~/mount/[VOLUME_NAME]

sshfs user@host:/path/to/open/ ~/mount/[VOLUME_NAME] -ovolname=VOLUME_NAME
```