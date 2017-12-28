module.exports = {
  solc: {
    optimizer: {
      enabled: true,
      runs: 10000
    }
  },
  networks: {
    development: {
      host: "localhost",
      port: 8545,
      network_id: "*", // Match any network id
      gasPrice: 21000000000,
      gas: 4500000
    },
    docker: {
      host: "testrpc",
      port: 8545,
      network_id: "*", // Match any network id
      gasPrice: 21000000000,
      gas: 4500000
    }
  },
  test_directory: 'test',
  migrations_directory: 'migrations',
};
