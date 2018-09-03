(**
 * Copyright (c) 2018, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the "hack" directory of this source tree.
 *
 *)

(* This saved state fetcher is used by servers which don't intend to use saved state *)
include (struct
  let fetch ~options:_ =
    Lwt.return Saved_state_fetcher.No_saved_state
end: Saved_state_fetcher.FETCHER)
