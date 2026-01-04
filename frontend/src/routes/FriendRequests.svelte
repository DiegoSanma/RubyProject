<script>
  import { onMount } from 'svelte'
  import { getFriendRequests, respondFriendRequest } from '../lib/friends'

  let requests = []

  async function loadRequests() {
    const res = await getFriendRequests()
    requests = await res.json()
  }

  onMount(loadRequests)

  async function respond(id, status) {
    await respondFriendRequest(id, status)
    loadRequests()
  }
</script>

<h1>Friend Requests</h1>

{#if requests.length === 0}
  <p>No pending requests</p>
{/if}

<ul>
  {#each requests as req}
    <li>
      {req.sender.email}
      <button on:click={() => respond(req.id, 'accepted')}>
        Accept
      </button>
      <button on:click={() => respond(req.id, 'rejected')}>
        Reject
      </button>
    </li>
  {/each}
</ul>
