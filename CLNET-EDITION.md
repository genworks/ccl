# Clozure CL, common-lisp.net edition

This branch is the Clozure CL 1.14 release with fixes added that are
waiting in a pull request to [Clozure/ccl](https://github.com/Clozure/ccl),
built and published by common-lisp.net until a Clozure CL release carries
them.  It is not an official Clozure CL release: report problems with
these changes here, and everything else to
[Clozure/ccl](https://github.com/Clozure/ccl/issues).

`(lisp-implementation-version)` reports `1.14-clnet.N`, from
`*openmcl-edition*` in `level-1/version.lisp`, and the annotated tag
`v1.14-clnet.N` marks each build.  Each change is the commit of its pull
request cherry-picked onto the release (`git cherry-pick -x`, so its
message names the original).  A change leaves the edition when a Clozure
CL release carries it, and the edition itself is retired when a release
carries them all and no critical bug is waiting on upstream.

## Changes

| Change | Upstream |
|---|---|
| The GC no longer runs while a thread is still executing Lisp code: the record that a suspended thread owes an acknowledgement moves out of `tcr->flags`, where the x86-64 foreign-call return's unlocked `btrq` could erase it | issue #718, PR #719 |
| The closures of a `LABELS` are linked to one another through the GC's write barrier (`.SPgvset`), so an ephemeral GC between their allocations no longer leaves a stale pointer to a sibling | issue #726, PR #727; regression test Clozure/ccl-tests PR #40 |

## Building

As upstream: `make` in `lisp-kernel/<platform>`, then
`(rebuild-ccl :full t)` from the release's bootstrap binaries.  Because
the second change is in the compiler, load the edition's compiler first,
so that the rebuild compiles every file with it:

    ccl -n -b -e "(progn (ccl::compile-ccl t) (rebuild-ccl :full t))"

Images built from this branch are published as
`clfoundation/ccl:1.14-clnet-*`; see
[cl-docker-images/ccl](https://gitlab.common-lisp.net/cl-docker-images/ccl).
