output "elb_dns_name" {
  value       = "${module.main.elb_dns_name}"
  description = "The domain name of the load balancer"
}
