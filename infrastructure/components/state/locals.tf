locals {
    bucket_name = "${var.project}-${data.aws_caller_identity.current.account_id}-${var.region}"
    default_tags = {
        Project = "${var.project}"
        Component = "${var.component}"
        Environment = "${var.environment}"
    }
}