# Homework Assignment

This app shows a feed taken from a URL, and  uses CoreData to display the feed even when offline.

## Used Pods

- AFNetworking
- MagicalRecord
- SDWebImage

### AFNetworking

Used to fetch the json resource. As raw.githubusercontent.com sends in a `text/plain` header in every file served, AFHTTPRequestSerializer was used to make it work, then manual NSJSONSerialization has been used.

## MagicalRecord

Used to easily manage the local schema. [mogenerator](https://rentzsch.github.io/mogenerator/) has been used in order to keep every change (if any) in the used classes.

## SDWebImage

Fetch and cache images.
