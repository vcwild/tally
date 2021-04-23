defmodule Tally.Supplies.Scheduler do
  use GenServer

  alias Tally.Supplies.Notification

  def start_link(_state) do
    GenServer.start_link(__MODULE__, %{})
  end

  @impl true
  def init(state \\ %{}) do
    schedule_notification()
    {:ok, state}
  end

  @impl true
  def handle_info(:generate, state) do
    Notification.send()

    schedule_notification()

    {:noreply, state}
  end

  defp schedule_notification do
    Process.send_after(self(), :generate, 1000 * 60)
  end
end

# def init(state) do
#   {:ok, state}
# end

# def handle_info(msg, state) do
#   IO.puts("Recebi sua mensagem")
#   {:noreply, state}
# end

# def handle_cast({:put, key, value}, state) do
#   {:noreply, Map.put(state, key, value)}
# end

# def handle_call({:get, key}, _from, state) do
#   {:reply, Map.get(state, key), state}
# end
