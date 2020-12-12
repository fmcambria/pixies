# MySQL Backup
Pixies is a MySQL backups system run in Kubernetes as a cronjob to perform automatic backups of all MySQL databases to Amazon S3.

## How to use?

- Set the cronjob execution time on pixies-cronjob.yaml file. (**schedule: "00 01 * * *"**)
- Set the environment variables (no secrets) on pixies-cronjob.yaml
- Create a secrets with the MySQL and AWS IAM credentials (use pixies-secrets.yaml file).
- Create a CronJob from pixies-cronjob.yaml 

## Environment Variables

The below table lists all of the Environment Variables that are configurable for Pixies.

| Environment Variable             | Purpose                                              |
| -------------------------------- | -----------------------------------------------------|
| DB_HOST                          | Database host IP or hostname                         |
| DB_USER                          | **(From secrets)** Database username                 |
| DB_PASSWORD                      | **(From secrets)** Database password                 |                  
| AWS_ACCESS_KEY_ID                | **(From secrets)** AWS IAM Access Key                |
| AWS_SECRET_ACCESS_KEY            | **(From secrets)** AWS IAM Secret Access Key         |                                                     
| BUCKET_NAME                      | The name of the S3 bucket                            |
| TARGET_HOSTNAME                  | Hostname or family name                              |

## License
[MIT](https://choosealicense.com/licenses/mit/)