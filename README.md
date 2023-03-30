## How to use [Blackboxed files](https://github.com/StackExchange/blackbox)

To decrypt blackboxed files please contact us using our email: [admin@it-lab.su](mailto:admin@it-lab.su)

## How to run application

```bash
# Configure swarm server:
make run-services
```

## Managing swarm examples

```bash
docker secret create odin_o1_mocked_phones phones

docker service update odin_backend \
    --secret-rm=odin_upay_key \
    --secret-rm=odin_upay_secret \
    --secret-add source=odin_cashier_admin_username,target=/var/run/secrets/CASHIER_USERNAME_FILE \
    --secret-add source=odin_cashier_admin_password,target=/var/run/secrets/CASHIER_PASSWORD_FILE \
    --env-rm=UPAY_KEY_FILE \
    --env-rm=UPAY_SECRET_FILE \
    --env-add=CASHIER_URL=http://cashier/cashier \
    --env-add=CASHIER_MARKETPLACE=1 \
    --env-add=CASHIER_USERNAME_FILE=/var/run/secrets/CASHIER_USERNAME_FILE \
    --env-add=CASHIER_PASSWORD_FILE=/var/run/secrets/CASHIER_PASSWORD_FILE


docker service update odin_backend \
  --secret-rm=odin_o1_mocked_phones \
  --replicas=0
```
