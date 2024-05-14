resource "yandex_iam_service_account" "test-sa" {
  name = "test-sa"
}

resource "yandex_resourcemanager_folder_iam_member" "test-sa-editor" {
  folder_id = var.folder_id
  role      = "storage.editor"
  member    = "serviceAccount:${yandex_iam_service_account.test-sa.id}"
}

resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
  service_account_id = yandex_iam_service_account.test-sa.id
  description        = "static access key for object storage"
}



resource "yandex_iam_service_account" "sa-ig" {
  name = "sa-ig"
}

resource "yandex_resourcemanager_folder_iam_member" "sa-ig-editor" {
  folder_id = var.folder_id
  role      = "editor"
  member    = "serviceAccount:${yandex_iam_service_account.sa-ig.id}"
}