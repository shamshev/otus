#!/bin/bash -xe

ORGANIZATION_ID="111111111111"
PROJECT_NAME="otus-2020"
SERVICE_ACCOUNT="otus-openshift"
ZONE_NAME="openshift"
DNS_NAME="example.com"
DNS_DESCRIPTION="DNS zone for Openshift"

# Create Project
gcloud projects create ${PROJECT_NAME} --organization=${ORGANIZATION_ID}
# After creation add billing account to your project

# Enable GCP APIs
gcloud services enable compute.googleapis.com --project ${PROJECT_NAME}
gcloud services enable cloudapis.googleapis.com --project ${PROJECT_NAME}
gcloud services enable cloudresourcemanager.googleapis.com --project ${PROJECT_NAME}
gcloud services enable dns.googleapis.com --project ${PROJECT_NAME}
gcloud services enable iam.googleapis.com --project ${PROJECT_NAME}
gcloud services enable iamcredentials.googleapis.com --project ${PROJECT_NAME}
gcloud services enable servicemanagement.googleapis.com --project ${PROJECT_NAME}
gcloud services enable serviceusage.googleapis.com --project ${PROJECT_NAME}
gcloud services enable storage-api.googleapis.com --project ${PROJECT_NAME}
gcloud services enable storage-component.googleapis.com --project ${PROJECT_NAME}

# Create Service Account
gcloud iam service-accounts create ${SERVICE_ACCOUNT} --project ${PROJECT_NAME}

gcloud projects add-iam-policy-binding ${PROJECT_NAME} --member serviceAccount:${SERVICE_ACCOUNT}@${PROJECT_NAME}.iam.gserviceaccount.com --role roles/compute.admin
gcloud projects add-iam-policy-binding ${PROJECT_NAME} --member serviceAccount:${SERVICE_ACCOUNT}@${PROJECT_NAME}.iam.gserviceaccount.com --role roles/dns.admin
gcloud projects add-iam-policy-binding ${PROJECT_NAME} --member serviceAccount:${SERVICE_ACCOUNT}@${PROJECT_NAME}.iam.gserviceaccount.com --role roles/iam.securityAdmin
gcloud projects add-iam-policy-binding ${PROJECT_NAME} --member serviceAccount:${SERVICE_ACCOUNT}@${PROJECT_NAME}.iam.gserviceaccount.com --role roles/iam.serviceAccountAdmin
gcloud projects add-iam-policy-binding ${PROJECT_NAME} --member serviceAccount:${SERVICE_ACCOUNT}@${PROJECT_NAME}.iam.gserviceaccount.com --role roles/iam.serviceAccountUser
gcloud projects add-iam-policy-binding ${PROJECT_NAME} --member serviceAccount:${SERVICE_ACCOUNT}@${PROJECT_NAME}.iam.gserviceaccount.com --role roles/storage.admin
gcloud projects add-iam-policy-binding ${PROJECT_NAME} --member serviceAccount:${SERVICE_ACCOUNT}@${PROJECT_NAME}.iam.gserviceaccount.com --role roles/iam.serviceAccountKeyAdmin

gcloud iam service-accounts keys create ${SERVICE_ACCOUNT}.json --iam-account=${SERVICE_ACCOUNT}@${PROJECT_NAME}.iam.gserviceaccount.com

# Create DNS Zone
gcloud dns managed-zones create ${ZONE_NAME} --description="${DNS_DESCRIPTION}" --dns-name=${DNS_NAME} --project ${PROJECT_NAME}

# gcloud iam service-accounts delete ${SERVICE_ACCOUNT}@${PROJECT_NAME}.iam.gserviceaccount.com
# gcloud dns managed-zones delete ${ZONE_NAME} --project ${PROJECT_NAME}
# gcloud projects delete ${PROJECT_NAME}
