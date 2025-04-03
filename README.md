# ttyd-python-zsh

A minimal Ubuntu-based Docker image that:

- Provides a browser-based terminal using [ttyd](https://github.com/tsl0922/ttyd)
- Runs with `zsh` and [Oh My Zsh](https://ohmyz.sh/)
- Includes Python 3 with `pip` and `venv` support
- Includes `tmux` and `neofetch`
- Supports passing an SSH private key securely via env var

Perfect for remote development, lightweight cloud terminals, or personal dashboards.

---

## 🚀 Features

- ✅ Ubuntu 22.04 base image
- ✅ Python 3, pip, venv
- ✅ Zsh with Oh My Zsh
- ✅ Tmux for multi-pane sessions
- ✅ ttyd for web-based terminal access
- ✅ SSH key injection via environment variable
- ✅ Neofetch on login
- ✅ Environment variable-based login (for Railway or similar platforms)

---

## 🧑‍💻 Usage

### 🐳 Build and run locally

```bash
docker build -t ttyd-python-zsh .
docker run \
  -e PORT=7681 \
  -e USERNAME=admin \
  -e PASSWORD=secret \
  -e SSH_KEY="$(cat ~/.ssh/id_rsa)" \
  -p 7681:7681 \
  ttyd-python-zsh
```

Open your browser at [http://localhost:7681](http://localhost:7681)
→ Log in with your `USERNAME` and `PASSWORD`

---

## 🛠 Environment Variables

| Variable     | Description                             |
|--------------|-----------------------------------------|
| `PORT`       | Port to serve ttyd on                   |
| `USERNAME`   | Login username (optional)               |
| `PASSWORD`   | Login password (optional)               |
| `CREDENTIAL` | Optional debug info (not used at runtime) |
| `SSH_KEY`    | Private key for SSH access (multi-line supported) |

> 🚨 For `SSH_KEY`, paste the full contents of your private key. Use `\n` for line breaks if setting via Railway's web UI.

---

## 🧱 Included Packages

- Python 3 + pip + venv
- zsh + Oh My Zsh
- neofetch
- tmux
- ttyd

---
