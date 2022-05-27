## 0.2.0 2022-05-27

###  Added
- Add methods to get the value by given keyword name  to `OrgPropertyDrawer`.
  - `get`
  - `lookup`
- Add properties to get the value of in-buffer settings to `OrgData`.
  - `title`
  - `date`
  - `author`
  - `filetags`
  - `tags`
  - `category`
  - `properties`
- Add `name` property to `OrgLink`.
- Add a method to get all links of a file/buffer to `OrgData`.
  - `getAllLinks`
- Add methods to improve `OrgParser`.
  - `parseType`
  - `parseSync`
- Add `headline` property to `OrgSection`.
- Add methods to get headlines and sub sections to `OrgSection`.
  - `getAllHeadlines`,
  - `getSubsections`
###  Changed
- Upgrade uniorg to 0.5.2.

## 0.1.0

* Initial Development Release.
