/**
 * Copyright 2021 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

variable "project_id" {
  description = "The project ID to provision resources to."
  type        = string
}

variable "region" {
  description = "The Google Cloud region name to provision resources in."
  type        = string
  default     = "us-central1"
}

variable "deployment_name" {
  description = "The name used to provision resources with."
  type        = string
  default     = "log-analysis"
}

variable "labels" {
  type        = map(string)
  description = "A set of key/value label pairs to assign to the resources deployed by this blueprint."
  default     = {}
}

variable "enable_apis" {
  type        = string
  description = "Whether or not to enable underlying apis in this solution."
  default     = true
}

variable "delete_contents_on_destroy" {
  type        = bool
  description = "If set to true, delete all BQ resources."
  default     = false
}

variable "service_account_email" {
  type        = string
  description = <<EOF
  Service account to be used in Bigquery Data Transfer jobs. If set,
  bigquery.dataEditor,storage.objectViewer roles should be granted to this SA. Additionally,
  service-project_number@gcp-sa-bigquerydatatransfer.iam.gserviceaccount.com service agent
  should also be granted iam.serviceAccountShortTermTokenMinter on this SA.
  EOF
  default     = ""
}