# Contributing to GitBlue!

Thank you for taking the time to contribute! We welcome contributions from everyone and appreciate your help in making GitBlue better.

This guide outlines the process for reporting bugs, suggesting enhancements, and submitting pull requests.

---

## Code of Conduct

This project and everyone participating in it is governed by our [Code of Conduct](CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code. Please report unacceptable behavior to newssungoldentoday@gmail.com.

---

## How Can I Contribute?

### Reporting Bugs
Before creating a bug report, please check our [existing issues](https://github.com/Blue-Cannon/gitblue/issues) to see if the problem has already been reported.

If it is a new bug, please open an issue and include:
* A clear and descriptive **title**.
* The **steps to reproduce** the behavior.
* Your specific **environment details** (OS, runtime version, browser, etc.).
* The **expected vs. actual** behavior.
* **Stack traces** or error logs, if applicable.

*Note: If you find a critical security vulnerability, do not open a public issue. Please report it privately by emailing newssungoldentoday@gmail.com.*

### Suggesting Enhancements
We are always open to new ideas! To suggest an enhancement:
* Search the issue tracker to ensure it hasn't been suggested before.
* Open a new issue and explain the **problem** you want to solve, the **proposed solution**, and why this feature would be useful to most users.

### Submitting Pull Requests (PRs)
1. **Fork the repository** and clone it locally.
2. Create a new branch named after your feature or fix: `git checkout -b feature/my-awesome-feature`.
3. Make your changes, ensuring you follow our **Style Guide** below.
4. Run the test suite locally to verify nothing is broken: `crystal spec`.
5. Commit your changes using descriptive commit messages: `git commit -m "Fix: resolve memory leak in parser"`.
6. Push to your fork: `git push origin feature/my-awesome-feature`.
7. Open a **Pull Request** against our `blue` branch.

---

## Style Guide & Conventions

### Coding Standards
* Follow the code style enforced by our linter. Run `./bin/ameba` to check for errors before committing.
* Write clean, documented, and maintainable code.

### Commit Messages
* Use the imperative mood in the subject line (e.g., "Add feature" instead of "Added feature").
* Keep the subject line under 50 characters.

---

## Getting Help

If you have questions or need guidance, please don't hesitate to reach out:
* Join our community chat at [Web Libera](https://web.libera.chat/#BlueBixt).
* Start a discussion in our [GitHub Discussions](https://github.com/Blue-Cannon/gitblue/discussions) forum.
