// graphify OpenCode plugin — V2 plugin API (`id` + `setup`).
// Injects a knowledge graph reminder before shell tool calls when the graph exists.
import { existsSync } from "node:fs"
import { join } from "node:path"

const REMINDER =
  '[graphify] knowledge graph at graphify-out/. For focused questions, run `graphify query "<question>"` ' +
  "(scoped subgraph, usually much smaller than GRAPH_REPORT.md) instead of grepping raw files. " +
  "Read GRAPH_REPORT.md only for broad architecture context."

export default {
  id: "graphify.project",
  setup(ctx) {
    const directory = ctx.location?.directory ?? process.cwd()
    let reminded = false

    ctx.tool.hook("execute.before", (event) => {
      if (reminded) return

      const tool = String(event?.tool ?? "").toLowerCase()
      if (tool !== "shell" && tool !== "bash") return

      const args = event?.input
      if (!args || typeof args !== "object") return
      if (typeof args.command !== "string" || !args.command) return

      // Another graphify plugin may have injected the reminder already.
      if (args.command.includes("[graphify]")) return

      if (!existsSync(join(directory, "graphify-out", "graph.json"))) return

      args.command = `echo '${REMINDER}' && ${args.command}`
      reminded = true
    })
  },
}
