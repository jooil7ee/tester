from google.oauth2 import service_account
from google.cloud import storage

GOOGLE_APPLICATION_CREDENTIALS="/home/svcapp_su/key/aidp-all@sktaic-datahub.json"

storage_client = storage.Client(
    credentials=service_account.Credentials.from_service_account_file(GOOGLE_APPLICATION_CREDENTIALS))

buckets = storage_client.list_buckets()

for bucket in buckets:
    print(bucket.name)
