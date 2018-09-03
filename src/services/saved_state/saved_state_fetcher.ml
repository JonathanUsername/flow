(**
 * Copyright (c) 2018, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the "hack" directory of this source tree.
 *
 *)

type result =
| Saved_state of {
  saved_state_filename: Path.t;
  changed_files: SSet.t;
}
| No_saved_state

module type FETCHER = sig
  val fetch: options:Options.t -> result Lwt.t
end
