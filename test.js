const commonProcess = {
  test: {},
  build: {},
  deploy: {},
  benchmark: {},
};
const trigger = {
  dev: {
    miniapp: commonProcess,
    mweb: commonProcess,
  },
  qa: {
    miniapp: commonProcess,
    mweb: commonProcess,
  },
  uat: {
    miniapp: commonProcess,
    mweb: commonProcess,
  },
  master: {
    miniapp: commonProcess,
    mweb: commonProcess,
  },
};
// v2
const jobs = (app = "", env = "") => {
  const s = shouldBuild();
  if (s.app !== app) {
    return;
  }
  mocrojob1 = test(app, env);
  microjob2 = build(app, name);
  mocrojob3 = deploy(app, env);
  if (env !== "develop") {
    microjob4 = benchmark(app, name);
  }
};
