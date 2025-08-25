
output "apsara_network_id" {
  value = yandex_vpc_network.apsara_network.id
}

output "rambha_subnet_id" {
  value = yandex_vpc_subnet.rambha_subnet.id
}

output "menaka_subnet_id" {
  value = yandex_vpc_subnet.menaka_subnet.id
}

output "urvashi_subnet_id" {
  value = yandex_vpc_subnet.urvashi_subnet.id
}

output "apsara_gateway_id" {
  value = yandex_vpc_gateway.apsara_gateway.id
}

output "apsara_route_table_id" {
  value = yandex_vpc_route_table.apsara_route_table.id
}

output "rambha_subnet_cidr" {
  value = yandex_vpc_subnet.rambha_subnet.v4_cidr_blocks[0]
}

output "menaka_subnet_cidr" {
  value = yandex_vpc_subnet.menaka_subnet.v4_cidr_blocks[0]
}

output "urvashi_subnet_cidr" {
  value = yandex_vpc_subnet.urvashi_subnet.v4_cidr_blocks[0]
}

output "security_group_id" {
  value = yandex_vpc_security_group.kubernetes_security_group.id
}
