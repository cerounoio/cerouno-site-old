require 'refile/s3'

aws = {
  access_key_id:     ENV['aws_access_key_id'],
  secret_access_key: ENV['aws_secret_access_key'],
  region:            ENV['aws_region'],
  bucket:            ENV['aws_bucket'],
}

Refile.cache = Refile::S3.new(prefix: 'cache', **aws)
Refile.store = Refile::S3.new(prefix: 'store', **aws)
