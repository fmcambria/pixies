# MySQL Backup
Pixies is a container image based on Alpine Linux. This container is designed to run in Kubernetes as a cronjob to perform automatic backups of MySQL databases to Amazon S3.

## How to use?

- Set the cronjob execution time on pixies-cronjob.yaml file. (**schedule: "00 01 * * *"**)
- Set the environment variables (no secrets) on pixies-cronjob.yaml
- Create a secreat with the MySQL and AWS IAM credentials, to do please rename pixies-secrets.yaml.sample to pixies-secrets.yaml and set yours credentials .
- Deploy the secrets on your cluster
  ```
  kubectl apply -f pixies-secrets.yaml 
  ```
- Deploy the cronjob on your cluster
  ```
  kubectl apply -f pixies-cronjob.yaml
  ```

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

