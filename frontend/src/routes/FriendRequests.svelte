<script>
  import { onMount } from 'svelte'
  import { getFriendRequests, respondFriendRequest, getFriendsList } from '../lib/friends'

  import Users from "./Users.svelte";

  let requests = []
  let friendsList = []

  async function loadRequests() {
    const friends = await getFriendsList()
    const res = await getFriendRequests()
    requests = await res.json()
    friendsList = await friends.json()
  }

  onMount(loadRequests)

  async function respond(id, status) {
    await respondFriendRequest(id, status)
    loadRequests()
  }

  let showUsers = false;

  function toggleUsers() {
    showUsers = !showUsers;
  }
</script>



<div class="py-10 px-4">
  <div class="max-w-4xl mx-auto grid grid-cols-1 md:grid-cols-2 gap-6">

    <!-- FRIEND REQUESTS -->
    <section class="bg-white rounded-xl shadow p-6">
      <h2 class="text-xl font-semibold mb-4">Friend Requests</h2>

      {#if requests.length === 0}
        <p class="text-gray-500 text-sm">No friend requests pending.</p>
      {:else}
        <ul class="space-y-3">
          {#each requests as req}
            <li class="flex items-center justify-between border rounded-lg p-3">
              <div>
                <p class="font-medium">{req.name}</p>
                <p class="text-sm text-gray-500">{req.email}</p>
              </div>

              <div class="flex gap-2">
                <button
                  on:click={() => respond(req.id,1)}
                  class="px-3 py-1 text-sm rounded bg-green-600 text-white hover:bg-green-700"
                >
                  Accept
                </button>
                <button
                  on:click={() => respond(req.id,2)}
                  class="px-3 py-1 text-sm rounded bg-red-600 text-white hover:bg-red-700"
                >
                  Decline
                </button>
              </div>
            </li>
          {/each}
        </ul>
      {/if}
    </section>

    <!-- FRIENDS -->
    <section class="bg-white rounded-xl shadow p-6">
      <h2 class="text-xl font-semibold mb-4">Friends</h2>

      {#if friendsList.length === 0}
        <p class="text-gray-500 text-sm">JAJJAJAJAJ YOU HAVE NO FRIENDS</p>
      {:else}
        <ul class="space-y-3">
          {#each friendsList as friend}
            <li class="flex items-center justify-between border rounded-lg p-3">
              <div>
                <p class="font-medium">{friend.name}</p>
                <p class="text-sm text-gray-500">{friend.email}</p>
              </div>

              <span class="text-xs bg-blue-100 text-blue-700 px-2 py-1 rounded">
                Friend
              </span>
            </li>
          {/each}
        </ul>
      {/if}
    </section>

  </div>
</div>
<div class="max-w-4xl mx-auto p-6">
  <!-- Dropdown button -->
  <div class="relative inline-block text-left">
    <button
      on:click={toggleUsers}
      class="inline-flex items-center gap-2 rounded-md bg-neutral-primary-medium px-4 py-2 text-sm font-medium text-heading hover:bg-neutral-tertiary"
    >
      Check out other Users
      <svg
        class="w-4 h-4"
        fill="none"
        stroke="currentColor"
        stroke-width="2"
        viewBox="0 0 24 24"
      >
        <path stroke-linecap="round" stroke-linejoin="round" d="m19 9-7 7-7-7" />
      </svg>
    </button>
  </div>

  <!-- Render dinámico -->
  {#if showUsers}
    <div class="mt-6">
      <Users />
    </div>
  {/if}
</div>

