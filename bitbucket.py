# This script is a work in progress: it aims to link the file being currently
# edited to its version on the Bitbucket server. For example, while editing line
# 42, calling this script should compute the URL to this file/line number on the
# bitbucket server, and perhaps fire up a browser.

import subprocess
import os
import vim

DIRPATH  = vim.eval("getcwd()")

def git_cmd(args, run_dir='.'):
    cmdline = [ "git", "-C", run_dir ] + args
    completed = subprocess.run(cmdline, stdout=subprocess.PIPE)
    completed.check_returncode()
    completed.check_returncode()
    return completed.stdout.decode().strip('\n')

class BitBucketRepo:
    BASE_URL = "http://dev.ks.int/stash/projects/{projectname}/repos/{reponame}"

    def __init__(self, dirpath):
        self.dirpath = dirpath

        self.branch_name = \
            git_cmd(["rev-parse", "--abbrev-ref", "HEAD"], run_dir=self.dirpath)
        self.remote_url = \
            git_cmd(["remote", "get-url", "origin"], run_dir=self.dirpath)

    def repo_name(self):
        return self.remote_url.split('/')[-1].split('.')[0]

    def project_name(self):
        return self.remote_url.split('/')[-2]

    def browse(self, filepath, branch=None, lines=None):
        branch = branch or self.branch_name
        url = self.BASE_URL.format(projectname=self.project_name(),
                                   reponame=self.repo_name()) \
            + '/browse/' + filepath + "?at=refs%2Fheads%2F{}".format(branch)
        if lines:
            url += "#{}".format(lines)
        return url

def get_lines(visual_mode=False):
    if visual_mode:
        start_mark = vim.current.buffer.mark('<')
        end_mark   = vim.current.buffer.mark('>')
        return "{}-{}".format(start_mark[0], end_mark[0])
    else:
        return str(vim.current.window.cursor[0])

CURRENT_FILE = vim.eval("@%")
CURRENT_LINE = vim.current.window.cursor[0]

repo = BitBucketRepo(vim.eval("getcwd()"))
get_lines()
