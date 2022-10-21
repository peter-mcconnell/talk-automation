demo flow
=========

prep
----

remember to review kube config server ip
remember notifications

flow
----

docker-compose overview
    database
    rundeck
    some nodes to execute tests against (if we have time)
    authentication

general UI -> projects -> jobs

create job (create s3 bucket)
 - remember notifications

```python3
#!/usr/bin/env python3
import os
import boto3
from botocore.exceptions import ClientError

BUCKET_NAME = os.getenv("RD_OPTION_BUCKET_NAME")
REGION = os.getenv("RD_OPTION_REGION")

try:
    client = boto3.client("s3", region_name=REGION)
    client.create_bucket(Bucket=BUCKET_NAME, CreateBucketConfiguration={
        "LocationConstraint": REGION,
    })
    print("bucket created!")
except ClientError as err:
    print(err)
```

other jobs -> kubernetes
other jobs -> scrape nodes

final slides (tips + bye)
