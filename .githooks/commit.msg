#!/usr/bin/env bash

message=$(head -n 1 "$1")

pattern="^(feat|fix|docs|refactor|test|build|ci|chore): .+"

if [[ ! "$message" =~ $pattern ]]; then
    echo "Invalid commit message."
    echo ""
    echo "Examples:"
    echo "feat: add forward kinematics"
    echo "fix: correct jacobian computation"
    echo "docs: update README"
    exit 1
fi