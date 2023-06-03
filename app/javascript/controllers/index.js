// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import ConnectionSubscriptionController from "./connection_subscription_controller"
application.register("connection-subscription", ConnectionSubscriptionController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import SubmitConnectionRequestController from "./submit_connection_request_controller"
application.register("submit-connection-request", SubmitConnectionRequestController)
