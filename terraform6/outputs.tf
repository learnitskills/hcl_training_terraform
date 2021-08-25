output "arn" {
  value = aws_s3_bucket.s3_bucket.arn 
}
output "name" {
  value = aws_s3_bucket.s3_bucket.id 
}
output "domain" {
  value = aws_s3_bucket.s3_bucket.website_domain
}

output "endpoint" {
  value = aws_s3_bucket.s3_bucket.website_endpoint
}