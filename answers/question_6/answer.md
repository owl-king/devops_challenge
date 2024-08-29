Write a ci-policy module that contains:
- A role, with no permissions, which can be assumed by users within the same account 
● A policy, allowing users / entities to assume the above role 
● A group, with the above policy attached 
● A user, belonging to the above group

Nothing special with this question, just go to aws module on terraform docs, find docs related to role, iam, group and policy. Good reminder with principal that does not allow wildcard users in principal attributes

## Ref:
- https://registry.terraform.io/providers/hashicorp/aws/latest/docs
- https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_principal.html
