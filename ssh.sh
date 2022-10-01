echo email:
read email

ssh-keygen -t ed25519 -C "$email"
ssh-add ~/.ssh/id_ed25519
