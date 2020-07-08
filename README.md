# terraform-alks

[`dkolb/terraform-alks`](https://hub.docker.com/r/dkolb/terraform-alks/)

Run Terraform in Docker with the [ALKS Provider](https://github.com/Cox-Automotive/terraform-provider-alks) installed. 

## Running

### Terraform

To run Terraform, use the Terraform CLI call just like you normally would do:

```
docker run -it -v $(PWD):/work \
    -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
    -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
    -e AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN \
    dkolb/terraform-alks version
```
