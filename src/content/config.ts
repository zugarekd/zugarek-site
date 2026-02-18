import { defineCollection, z } from "astro:content";

const projects = defineCollection({
  schema: z.object({
    title: z.string(),
    date: z.coerce.date(),
    category: z.enum(["marine", "distributed-systems", "embedded", "finance", "misc"]),
    tags: z.array(z.string()).default([]),
    summary: z.string().max(240),
    heroImage: z.string().optional(),
    github: z.string().url().optional(),
    links: z.array(z.object({ label: z.string(), url: z.string().url() })).default([]),
  }),
});

export const collections = { projects };
