resource "yandex_storage_bucket" "test-bucket" {
  access_key    = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key    = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  bucket        = "test-storage-picture"
  acl           = "public-read"
  force_destroy = "true"
}

resource "yandex_storage_object" "image-object" {
  access_key    = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key    = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  bucket        = "test-storage-picture"
  acl           = "public-read"
  key           = "Screenshot_1.jpg"
  source        = "data/Screenshot_1.jpg"
  depends_on    = [yandex_storage_bucket.test-bucket]
}