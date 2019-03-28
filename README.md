# atomist/sdm-base

A base Docker image for creating Docker images for your Atomist
Software Delivery Machine (SDM).

## Using

Add this line to the top of your Dockerfile

```dockerfile
FROM atomist/sdm-base:M.N.P
```

replacing `M.N.P` with the [latest release][release] of this image.

[release]: https://github.com/atomist/sdm-base/releases/latest (Latest Release of atomist/sdm-base)

## Support

General support questions should be discussed in the `#support`
channel in our community Slack workspace
at [atomist-community.slack.com][slack].

If you find a problem, please create an [issue][].

[issue]: https://github.com/atomist/sdm-base/issues

## Development

See the [Atomist developer documentation][atomist-dev] for information
on how to write your own SDM features and automations.

[atomist-dev]: https://docs.atomist.com/developer/ (Atomist Developer Documentation)

### Release

Releases are handled via the SDM itself.  Just press the release
button in Slack or the Atomist dashboard.

---

Created by [Atomist][atomist].
Need Help?  [Join our Slack team][slack].

[atomist]: https://atomist.com/ (Atomist - How Teams Deliver Software)
[slack]: https://join.atomist.com/ (Atomist Community Slack)
