variable "aws_region" {
  default = "us-east-1"
}

variable "s3_bucket_name" {
  type        = string
  description = "Nombre del bucket S3"
}

variable "suffix" {
  description = "Sufijo para evitar nombres duplicados"
  type        = string
}
variable "lambda_arn" {
  description = "ARN de la función Lambda (opcional)"
  type        = string
  default     = null
}
