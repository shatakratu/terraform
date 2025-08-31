# VPC (network)

resource "yandex_vpc_network" "apsara_network" {
  name        = "apsara-network"
  folder_id   = var.YC_FOLDER_ID
  description = "kubernetes network"
}

#  subnet rambha

resource "yandex_vpc_subnet" "rambha_subnet" {
  name           = "rambha-subnet"
  zone           = "ru-central1-a"
  v4_cidr_blocks = ["10.10.10.0/24"]
  network_id     = yandex_vpc_network.apsara_network.id
  route_table_id = yandex_vpc_route_table.apsara_route_table.id # attach route table to subnet
  description    = "master1, worker1"
}

#  subnet menaka

resource "yandex_vpc_subnet" "menaka_subnet" {
  name           = "menaka-subnet"
  zone           = "ru-central1-b"
  v4_cidr_blocks = ["10.10.20.0/24"]
  network_id     = yandex_vpc_network.apsara_network.id
  route_table_id = yandex_vpc_route_table.apsara_route_table.id
  description    = "master2, worker2"
}

#  subnet urvashi

resource "yandex_vpc_subnet" "urvashi_subnet" {
  name           = "urvashi-subnet"
  zone           = "ru-central1-d"
  v4_cidr_blocks = ["10.10.80.0/24"]
  network_id     = yandex_vpc_network.apsara_network.id
  route_table_id = yandex_vpc_route_table.apsara_route_table.id
  description    = "master3, worker3"
}

#  gateway (shared_egress)

resource "yandex_vpc_gateway" "apsara_gateway" {
  name = "apsara-gateway"
  shared_egress_gateway {}
}

#  route table ( 0.0.0.0/0 → gateway)

resource "yandex_vpc_route_table" "apsara_route_table" {
  network_id = yandex_vpc_network.apsara_network.id
  name       = "apsara-route-table"

  static_route {
    destination_prefix = "0.0.0.0/0"
    gateway_id         = yandex_vpc_gateway.apsara_gateway.id
  }
}
