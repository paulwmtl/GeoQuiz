# Contributing to iOS App

First off, thank you for considering contributing to this iOS app! 🎉

## 📋 Table of Contents

- [Code of Conduct](#code-of-conduct)
- [How Can I Contribute?](#how-can-i-contribute)
- [Development Setup](#development-setup)
- [Coding Standards](#coding-standards)
- [Pull Request Process](#pull-request-process)
- [Commit Message Guidelines](#commit-message-guidelines)

## 📜 Code of Conduct

This project and everyone participating in it is governed by a Code of Conduct. By participating, you are expected to uphold this code. Please report unacceptable behavior to the project maintainers.

### Our Standards

- Be respectful and inclusive
- Welcome newcomers and help them learn
- Focus on what is best for the community
- Show empathy towards other community members

## 🤝 How Can I Contribute?

### Reporting Bugs

Before creating bug reports, please check the issue list as you might find out that you don't need to create one. When you are creating a bug report, please include as many details as possible:

- **Use a clear and descriptive title**
- **Describe the exact steps to reproduce the problem**
- **Provide specific examples**
- **Describe the behavior you observed**
- **Explain which behavior you expected to see instead**
- **Include screenshots if applicable**
- **Include iOS version and device information**

### Suggesting Enhancements

Enhancement suggestions are tracked as GitHub issues. When creating an enhancement suggestion, please include:

- **Use a clear and descriptive title**
- **Provide a detailed description of the suggested enhancement**
- **Provide specific examples to demonstrate the steps**
- **Describe the current behavior and expected behavior**
- **Explain why this enhancement would be useful**

### Your First Code Contribution

Unsure where to begin? You can start by looking through `beginner` and `help-wanted` issues:

- **Beginner issues**: Issues which should only require a few lines of code
- **Help wanted issues**: Issues which should be a bit more involved

## 🛠 Development Setup

1. **Fork and clone the repository**
   ```bash
   git clone https://github.com/yourusername/ios-app.git
   cd ios-app
   ```

2. **Open in Xcode**
   - Create a new Xcode project in this directory
   - Import the source files

3. **Create a branch**
   ```bash
   git checkout -b feature/my-new-feature
   ```

## 📝 Coding Standards

### Swift Style Guide

Follow the [Swift API Design Guidelines](https://swift.org/documentation/api-design-guidelines/):

- Use **PascalCase** for type names (classes, structs, enums)
- Use **camelCase** for variable and function names
- Use meaningful and descriptive names
- Prefer clarity over brevity

### Code Organization

```swift
// MARK: - Properties

// MARK: - Initialization

// MARK: - Lifecycle

// MARK: - Public Methods

// MARK: - Private Methods
```

### SwiftUI Best Practices

- Keep views small and focused
- Extract complex logic into ViewModels
- Use @StateObject for owned objects
- Use @ObservedObject for passed objects
- Use @EnvironmentObject for app-wide state

### Example Good Code

```swift
struct UserProfileView: View {
    // MARK: - Properties
    
    @StateObject private var viewModel = UserProfileViewModel()
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 16) {
            profileImage
            userInfo
            actionButton
        }
        .padding()
    }
    
    // MARK: - View Components
    
    private var profileImage: some View {
        AsyncImage(url: viewModel.imageURL) { image in
            image.resizable()
        } placeholder: {
            ProgressView()
        }
        .frame(width: 100, height: 100)
        .clipShape(Circle())
    }
    
    private var userInfo: some View {
        VStack(spacing: 8) {
            Text(viewModel.userName)
                .font(.headline)
            Text(viewModel.userEmail)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
    
    private var actionButton: some View {
        Button("Edit Profile") {
            viewModel.editProfile()
        }
        .buttonStyle(.borderedProminent)
    }
}
```

### Testing Requirements

- Write unit tests for all ViewModels
- Write unit tests for all Services
- Write UI tests for critical user flows
- Aim for at least 80% code coverage on business logic

## 🔄 Pull Request Process

1. **Update documentation** - Update README.md or other docs if needed
2. **Write tests** - Add tests for new features
3. **Follow coding standards** - Ensure code follows our style guide
4. **Update CHANGELOG** - Add your changes to the unreleased section
5. **Create Pull Request** with a clear title and description:

   ```markdown
   ## Description
   Brief description of changes
   
   ## Motivation and Context
   Why is this change required?
   
   ## How Has This Been Tested?
   Describe the tests you ran
   
   ## Screenshots (if applicable)
   Add screenshots
   
   ## Types of changes
   - [ ] Bug fix (non-breaking change which fixes an issue)
   - [ ] New feature (non-breaking change which adds functionality)
   - [ ] Breaking change (fix or feature that would cause existing functionality to change)
   
   ## Checklist
   - [ ] My code follows the code style of this project
   - [ ] I have updated the documentation accordingly
   - [ ] I have added tests to cover my changes
   - [ ] All new and existing tests passed
   ```

6. **Wait for review** - A maintainer will review your PR
7. **Address feedback** - Make requested changes if any
8. **Merge** - Once approved, your PR will be merged

## 📏 Commit Message Guidelines

Follow the [Conventional Commits](https://www.conventionalcommits.org/) specification:

```
<type>(<scope>): <subject>

<body>

<footer>
```

### Types

- **feat**: A new feature
- **fix**: A bug fix
- **docs**: Documentation only changes
- **style**: Changes that don't affect code meaning (formatting, etc.)
- **refactor**: Code change that neither fixes a bug nor adds a feature
- **perf**: Performance improvement
- **test**: Adding or updating tests
- **chore**: Changes to build process or auxiliary tools

### Examples

```bash
feat(auth): add login functionality

fix(network): handle timeout errors properly

docs(readme): update installation instructions

refactor(viewmodel): simplify user profile logic

test(services): add unit tests for NetworkService
```

## ❓ Questions?

Feel free to contact the maintainers if you have any questions:

- Open an issue with the `question` label
- Reach out via email

## 🎉 Recognition

Contributors will be recognized in:
- README.md contributors section
- Release notes
- Special mentions for significant contributions

---

**Thank you for contributing! 🙏**
