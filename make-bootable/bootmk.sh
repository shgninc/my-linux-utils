#!/bin/bash
dd if=$1 of=$2 bs=4M conv=fdatasync status=progress
