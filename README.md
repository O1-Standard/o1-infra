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
  --env-add=O1_MOCKED_PHONES=/var/run/secrets/O1_MOCKED_PHONES_FILE \
  --secret-add source=odin_o1_feedback_email,target=/var/run/secrets/O1_FEEDBACK_EMAIL_FILE \
  --secret-add source=odin_o1_mocked_phones,target=/var/run/secrets/O1_MOCKED_PHONES_FILE \
  --replicas=2

docker service update odin_backend \
  --secret-rm=odin_o1_mocked_phones \
  --replicas=0
```