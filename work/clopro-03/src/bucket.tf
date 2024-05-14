resource "yandex_storage_bucket" "test-bucket" {
  access_key    = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key    = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  bucket        = "test-bucket-inyushov-yc"
  acl           = "public-read"
  force_destroy = "true"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = yandex_kms_symmetric_key.key-a.id
        sse_algorithm     = "aws:kms"
      }
    }
  }

}

resource "yandex_storage_object" "image-object" {
  access_key    = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key    = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  bucket        = yandex_storage_bucket.test-bucket.id
  acl           = "public-read"
  key           = "Screenshot_1.jpg"
  source        = "data/Screenshot_1.jpg"
  depends_on    = [
    yandex_storage_bucket.test-bucket,
  ]
}