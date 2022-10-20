#!/usr/bin/env python3
import os

import boto3
from botocore.exceptions import ClientError


BUCKET_NAME = os.getenv("RD_OPTION_BUCKET_NAME")
REGION = os.getenv("RD_OPTION_REGION")


try:
    client = boto3.client("s3", region_name=REGION)
    client.delete_bucket(Bucket=BUCKET_NAME)
    print("bucket deleted!")
except ClientError as err:
    print(err)
