# 📦 archive_and_encrypt.sh

A simple shell tool to compress a directory into a `.tar.gz` archive and encrypt it with a password using GPG symmetric encryption.

## 🛠️ Requirements

- `tar`
- `gpg` (GnuPG)

## 🚀 Usage

```bash
./archive_and_encrypt.sh <directory_to_compress>
```

Example:

```bash
./archive_and_encrypt.sh myfolder
```

- This creates `myfolder.tar.gz`
- Prompts you to enter a password
- Produces `myfolder.tar.gz.gpg`
- Deletes the unencrypted `myfolder.tar.gz` file

## 🔐 Decrypting the Archive

To decrypt and extract later:

```bash
gpg --output myfolder.tar.gz --decrypt myfolder.tar.gz.gpg
tar -xzf myfolder.tar.gz
```

## ⚠️ Notes

- Use a strong password you can remember.
- The original unencrypted `.tar.gz` is deleted after encryption for safety.
- You can modify the script if you prefer to keep the unencrypted archive.