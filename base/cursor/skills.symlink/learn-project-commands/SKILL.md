---
name: learn-project-commands
description: Learn how to run commands (build, test, activate environment) in unfamiliar projects. Use when you need to execute a build, test, lint, or run command and don't know the correct invocation, or when the project uses containers, environment modules, or activation scripts.
---

# Learn Project Commands

Many projects require non-trivial setup: environment modules, conda environments, containers, activation scripts, or custom wrappers. Never guess — ask the user.

## When This Applies

Before running any build, test, or project-specific command, check if you already know how. If not, follow this procedure.

## Step 1: Check for an Existing Rule

Look for `.cursor/rules/running-commands.mdc` in the project. If it exists and has actual commands (not TODOs), follow it. You're done.

## Step 2: Ask the User

If no rule exists or it's incomplete, ask the user. Use the AskQuestion tool if available, otherwise ask conversationally. Gather:

1. **Environment activation** — How to get a working shell (conda activate, module load, container exec, source script, etc.)
2. **Build** — How to build the project (and where the build directory is)
3. **Test** — How to run tests
4. **Run** — How to run the project or its tools

Not all projects need all four. Ask what's relevant. The user may answer "just do X" — that's fine, adapt.

## Step 3: Save as a Project Rule

Create `.cursor/rules/running-commands.mdc` with what you learned:

```markdown
---
description: How to build, test, and run commands in this project
alwaysApply: true
---

# Running Commands

## Environment Activation
<what the user told you>

## Building
<what the user told you>

## Running Tests
<what the user told you>
```

Only include sections the user provided. Keep it factual — commands and short notes, no filler.

## Step 4: Proceed

Now run the command you originally needed to run.
