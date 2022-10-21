demo flow
=========

remember to review kube config server ip

general UI -> projects -> jobs

create job (create s3 bucket)
 - explain how it is authenticated
 - notifications

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

closing notes
