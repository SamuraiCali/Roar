import { type ClientSchema, a, defineData } from '@aws-amplify/backend';

/*
 * Schema definition for Roar
 * - Post: Represents a social media post with video, tags, and timestamp.
 */

const schema = a.schema({
    Post: a.model({
        videoURL: a.string(),
        teamTag: a.string(),
        sportTag: a.string(),
        timestamp: a.datetime(),
        description: a.string().required(),
    })
        .authorization(allow => [
            // Allow anyone to read posts
            allow.publicApiKey().to(['read']),
            // Allow owners to create/update/delete their own posts
            allow.owner(),
        ]),
});

export type Schema = ClientSchema<typeof schema>;

export const data = defineData({
    schema,
    authorizationModes: {
        defaultAuthorizationMode: 'apiKey',
        // API Key is used for public access
        apiKeyAuthorizationMode: {
            expiresInDays: 30,
        },
    },
});
